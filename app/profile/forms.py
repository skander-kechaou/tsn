from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired

class EditProfileForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    # Add other fields like bio, interests, etc.
    submit = SubmitField('Save Changes')
