# app/main/routes.py
import datetime
import os

from sqlalchemy import or_
from flask_dance.consumer import oauth_authorized, oauth_error
from flask_dance.contrib.google import google # The proxy for the current Google session
from flask import Blueprint, render_template, request, redirect, url_for, flash, current_app
# from flask_security import Security, SQLAlchemyUserDatastore, UserMixin, RoleMixin
from flask_login import LoginManager, login_user, logout_user, current_user, login_required

from ..models import Post, VisibilityEnum, Like, User
from .. import db, security

bp = Blueprint('main', __name__,
               template_folder='templates',
               static_folder='static')

@bp.route('/')
def index():
    return render_template('main/index.html')

@bp.route('/dashboard')
@login_required
def dashboard():
    # get posts
    posts = Post.query.filter(
        (Post.visibility == VisibilityEnum.PUBLIC) |
        ((Post.visibility == VisibilityEnum.FRIENDS) & (Post.user_id.in_(current_user.friend_ids()))) |
        ((Post.visibility == VisibilityEnum.PRIVATE) & (Post.user_id == current_user.id))
    ).all()

    return render_template('main/dashboard.html', posts=posts)

@bp.route('/create_post', methods=['GET', 'POST'])
@login_required
def create_post():
    if request.method == 'POST':
        content = request.form['content']
        visibility = request.form['visibility']
        post = Post(
            user_id=current_user.id,
            content=content,
            visibility=VisibilityEnum(visibility)
        )
        db.session.add(post)
        db.session.commit()
        return redirect(url_for('main.dashboard'))

    return render_template('main/create_post.html')


@bp.route('/post/<int:post_id>/like', methods=['POST'])
@login_required
def like_post(post_id):
    post = Post.query.get_or_404(post_id)
    existing_like = Like.query.filter_by(user_id=current_user.id, post_id=post.id).first()

    if existing_like:
        db.session.delete(existing_like)
    else:
        like = Like(user_id=current_user.id, post_id=post.id)
        db.session.add(like)

    db.session.commit()
    return redirect(url_for('main.dashboard'))

@bp.route('/users')
@login_required
def users():
    page = request.args.get('page', 1, type=int) # For pagination later
    search_query = request.args.get('q', '').strip() # Get search query, default to empty string

    query = User.query.filter(User.id != current_user.id) # Exclude current user

    if search_query:
        # Simple search: username, first name, last name, email (be careful with email privacy)
        # Use ilike for case-insensitive search
        search_term = f"%{search_query}%"
        query = query.filter(
            or_(
                User.username.ilike(search_term),
                User.first_name.ilike(search_term), # Ensure you have first_name in User model
                User.last_name.ilike(search_term)   # Ensure you have last_name in User model
            )
        )

    # Order users, e.g., by username or registration date
    users_list = query.order_by(User.username.asc()).paginate(page=page, per_page=12) # Example: 12 users per page
                                                                                    # Using paginate for pagination

    return render_template('main/users.html',
                           title="Discover Users",
                           users_list=users_list, # Pass the pagination object
                           search_query=search_query) # Pass search query back for pre-filling search bar


@oauth_authorized.connect
def logged_in_with_google(blueprint, token):
    if blueprint.name != "google":  # Check if it's the Google blueprint signal
        return

    if not token:
        flash("Failed to log in with Google.", "error")
        return redirect(url_for("security.login"))  # Or your main page

    # Get user info from Google using the token
    try:
        # 'google' is the proxy object from flask_dance.contrib.google
        resp = google.get("/oauth2/v2/userinfo")  # Common endpoint for user info
        assert resp.ok, resp.text  # Ensure the request was successful
        google_user_info = resp.json()

        email = google_user_info.get("email")
        google_id = google_user_info.get("id")  # Google's unique user ID
        first_name = google_user_info.get("given_name")
        last_name = google_user_info.get("family_name")
        profile_pic_url = google_user_info.get("picture")  # URL to Google profile picture

    except Exception as e:
        current_app.logger.error(f"Could not fetch user info from Google: {e}")
        flash("Could not fetch user info from Google. Please try again.", "error")
        return redirect(url_for("security.login"))

    if not email:
        flash("Email not provided by Google. Cannot log in.", "error")
        return redirect(url_for("security.login"))

    # --- Query your database for an existing user ---
    # Option 1: User identified by email
    user = User.query.filter_by(email=email).first()

    # Option 2: User identified by Google ID (more robust if email can change or not primary)
    # You would need to add a 'google_id' field to your User model
    # user = User.query.filter_by(google_id=google_id).first()
    # if not user and email: # Fallback to email if google_id not found but email exists
    #     user = User.query.filter_by(email=email).first()
    #     if user and not user.google_id: # Link account if found by email and google_id not set
    #         user.google_id = google_id
    #         db.session.commit()

    if user:
        # User exists, log them in
        # If you added google_id and they logged in via email before:
        # if not user.google_id:
        #     user.google_id = google_id
        #     db.session.commit()
        pass  # User already exists
    else:
        # User does not exist, create a new user
        # Ensure your User model can handle this creation.
        # Password can be set to None or a long random string if they only use OAuth.
        try:
            # A simple username generation, ensure it's unique or adapt
            username_base = email.split('@')[0]
            username_candidate = username_base
            counter = 1
            while User.query.filter_by(username=username_candidate).first():
                username_candidate = f"{username_base}_{counter}"
                counter += 1

            # Create a placeholder password for users created via OAuth
            # This password should not be guessable or usable for direct login
            # unless you implement a "set password" feature later.
            # Flask-Security's datastore.create_user will hash it.
            placeholder_password = security.utils.hash_password(os.urandom(24).hex())

            user_data_for_creation = {
                'email': email,
                'username': username_candidate,
                'password': placeholder_password,  # Will be hashed by create_user
                'first_name': first_name or "",  # Provide default if None
                'last_name': last_name or "",  # Provide default if None
                'active': True,  # Or False if you want to implement an extra step
                'confirmed_at': datetime.utcnow(),  # Auto-confirm OAuth users
                # 'google_id': google_id, # If you have this field
                # 'profile_pic': profile_pic_url, # You might want to download and store it locally
                # or just store the Google URL
            }
            # Populate other required fields for your User model
            # For Enum fields like gender, you might need a default or logic to derive it
            # user_data_for_creation['gender'] = GenderEnum.PREFER_NOT_TO_SAY # Example default

            # Use Flask-Security's datastore to create the user
            # This ensures fs_uniquifier and other FS fields are handled
            user = security.datastore.create_user(**user_data_for_creation)
            # db.session.commit() # create_user usually commits

            # Optionally, assign a default role
            # default_role = security.datastore.find_or_create_role(name='user')
            # security.datastore.add_role_to_user(user, default_role)
            # db.session.commit()

            flash("Your account has been created using Google.", "success")
        except Exception as e:
            db.session.rollback()
            current_app.logger.error(f"Error creating new Google user: {e}", exc_info=True)
            flash(f"An error occurred while creating your account: {str(e)}", "error")
            return redirect(url_for("security.register"))  # Or security.login

    # Log the user in using Flask-Login
    if user:
        login_user(user)
        flash("Successfully logged in with Google!", "success")
        # Redirect to a 'next' URL if it exists, otherwise to dashboard
        next_url = request.args.get('next') or url_for('main.dashboard')
        return redirect(next_url)
    else:
        # This case should ideally not be reached if user creation succeeded or user existed
        flash("Login failed after Google authentication.", "error")
        return redirect(url_for("security.login"))


# Optional: Handle OAuth errors
@oauth_error.connect
def google_oauth_error(blueprint, error, error_description=None, error_uri=None):
    flash(f"OAuth error from {blueprint.name}: {error} description: {error_description}", "error")
    current_app.logger.error(f"OAuth error from {blueprint.name}: {error} desc: {error_description} uri: {error_uri}")
    return redirect(url_for("security.login"))

# You need to make sure these signal handlers are connected when the app is created.
# If this code is in app/__init__.py, it should be fine.
# If it's in a separate file (e.g., app/oauth_handlers.py), import that file in app/__init__.py
# so the @oauth_authorized.connect decorator runs.