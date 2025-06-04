from flask_wtf import FlaskForm
from flask_wtf.file import FileAllowed
from wtforms import TextAreaField, SelectField, SubmitField, FileField
from wtforms.validators import DataRequired, Length, Optional
from ..models import VisibilityEnum # Adjust path to your VisibilityEnum

class PostForm(FlaskForm):
    content = TextAreaField('What\'s on your mind?',
                            validators=[DataRequired(), Length(min=1, max=10000)])
    visibility = SelectField('Visibility',
                             choices=[(choice.value, choice.name.capitalize()) for choice in VisibilityEnum],
                             validators=[DataRequired()])
    media_upload = FileField('Upload Media', validators=[
        Optional(),
        FileAllowed(['png', 'jpg', 'jpeg',
                             'gif','mp4', 'mov', 'avi', 'mkv', 'webm'], 'Images or videos only!')
    ])
    submit = SubmitField('Post')

class EditPostForm(FlaskForm):
    content = TextAreaField('Content',
                            validators=[DataRequired(), Length(min=1, max=10000)])
    visibility = SelectField('Visibility',
                             choices=[(choice.value, choice.name.capitalize()) for choice in VisibilityEnum],
                             validators=[DataRequired()])
    new_media = FileField('Upload Media', validators=[
        Optional(),
        FileAllowed(['png', 'jpg', 'jpeg',
                             'gif','mp4', 'mov', 'avi', 'mkv', 'webm'], 'Images or videos only!')
    ])
    submit = SubmitField('Save Changes')

class CommentForm(FlaskForm):
    comment_text = TextAreaField('Comment', validators=[DataRequired(), Length(min=1, max=500)])
    submit = SubmitField('Post')