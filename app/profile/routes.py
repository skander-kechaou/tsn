from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import current_user, login_required
from .. import db
from ..models import User, Post, VisibilityEnum
from ..profile.forms import EditProfileForm  # Create a WTForm for profile editing

bp = Blueprint('profile', __name__, template_folder='templates')

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

@bp.route('/profile/edit', methods=['GET', 'POST'])
@login_required
def edit_profile():
    form = EditProfileForm(obj=current_user)
    if form.validate_on_submit():
        # Update user fields
        current_user.username = form.username.data
        # Optionally update additional fields: bio, interests, etc.
        db.session.commit()
        flash('Profile updated successfully!', 'success')
        return redirect(url_for('profile.view_profile', username=current_user.username))
    return render_template('profile/edit.html', form=form)
