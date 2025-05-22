from flask import Blueprint, render_template, request, redirect, url_for, flash, current_app
from flask_login import current_user, login_required
from .. import db
from ..models import User, Post, VisibilityEnum
from .forms import EditProfileForm  # Create a WTForm for profile editing
import os


bp = Blueprint('profile', __name__, template_folder='templates')

def save_picture(form_picture):
    """Saves uploaded picture and returns the filename."""
    if not form_picture:
        return current_user.profile_pic  # Return current pic if no new one is uploaded

    random_hex = os.urandom(8).hex()
    _, f_ext = os.path.splitext(form_picture.filename)
    if f_ext.lower() not in ['.png', '.jpg', '.jpeg',
                             '.gif']:  # Redundant if FileAllowed used, but good server-side check
        flash('Invalid image file type.', 'danger')
        return current_user.profile_pic  # Or handle error differently

    picture_fn = random_hex + f_ext
    # Create path relative to the 'static' folder.
    # Files should be saved within app.static_folder + '/images/profile_pics/'
    # app.static_folder is an absolute path. We need to join it.
    picture_path = os.path.join(current_app.static_folder, 'images', 'profile_pics', picture_fn)

    # Ensure the profile_pics directory exists
    profile_pics_dir = os.path.join(current_app.static_folder, 'images', 'profile_pics')
    os.makedirs(profile_pics_dir, exist_ok=True)

    try:
        form_picture.save(picture_path)
        # Return the path relative to the static folder for storing in DB and using in url_for
        return os.path.join('images', 'profile_pics', picture_fn).replace("\\", "/")  # Ensure forward slashes for URL
    except Exception as e:
        current_app.logger.error(f"Error saving picture: {e}")
        flash('Error saving profile picture.', 'danger')
        return current_user.profile_pic


@bp.route('/profile/<username>')
@login_required
def view_profile(username):
    profile_user = User.query.filter_by(username=username).first_or_404()
    # get posts
    user_posts = profile_user.posts.order_by(Post.timestamp.desc()).all()

    return render_template('profile/view.html',
                           user=profile_user,
                           posts=user_posts,
                           title=f"{{profile_user.first_name}} {{profile_user.last_name}}'s Profile}}")



@bp.route('/profile/<username>/edit', methods=['GET', 'POST'])
@login_required
def edit_profile(username):
    form = EditProfileForm(obj=current_user)  # Pre-populate form with current user's data using obj=
    # WTForms will match form field names to current_user attributes

    if form.validate_on_submit():
        # Update basic fields
        current_user.first_name = form.first_name.data
        current_user.last_name = form.last_name.data
        current_user.phone = form.phone.data
        current_user.date_birth = form.date_birth.data
        current_user.gender = form.gender.data  # WTForms SelectField provides the enum value
        current_user.biography = form.biography.data
        current_user.location = form.location.data

        # Handle profile picture update
        if form.profile_pic_upload.data:  # If a new file was uploaded
            # Optional: Delete old picture if it's not the default
            # if current_user.profile_pic and current_user.profile_pic != 'images/default_profile.jpg':
            #     old_pic_path = os.path.join(current_app.static_folder, current_user.profile_pic)
            #     if os.path.exists(old_pic_path):
            #         try:
            #             os.remove(old_pic_path)
            #         except Exception as e:
            #             current_app.logger.error(f"Error deleting old picture: {e}")

            picture_file_path_for_db = save_picture(form.profile_pic_upload.data)
            current_user.profile_pic = picture_file_path_for_db

        try:
            db.session.commit()
            flash('Your profile has been updated!', 'success')
            return redirect(
                url_for('profile.view_profile', username=current_user.username))
        except Exception as e:
            db.session.rollback()
            flash('An error occurred while updating your profile. Please try again.', 'danger')
            current_app.logger.error(f"Profile update error: {e}", exc_info=True)


    elif request.method == 'GET':
        # Pre-fill the form with existing data (already done by obj=current_user)
        # form.username.data = current_user.username (not needed if render_kw={'readonly':True} and obj used)
        # form.email.data = current_user.email (not needed if render_kw={'readonly':True} and obj used)
        form.first_name.data = current_user.first_name
        form.last_name.data = current_user.last_name
        form.phone.data = current_user.phone
        form.date_birth.data = current_user.date_birth
        form.gender.data = current_user.gender.value if current_user.gender else None  # Set current enum value for SelectField
        # form.about_me.data = current_user.about_me
        pass  # Form is already pre-populated by obj=current_user if attribute names match

    return render_template('profile/edit.html', title='Edit Profile', form=form)