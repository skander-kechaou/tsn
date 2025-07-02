# app/forms.py
from flask_security.forms import RegisterForm, StringField,BooleanField, PasswordField # Import base fields
from wtforms import DateField, SelectField, SubmitField # For Date and Enum
from wtforms.validators import DataRequired, Email, EqualTo, Length, Regexp, Optional, ValidationError
from ..models import GenderEnum, User
from flask_wtf import FlaskForm
import inspect
from wtforms import Field
from datetime import datetime


class ExtendedRegisterForm(RegisterForm): # Inherit from flask_security's RegisterForm
    username = StringField(
        'Username',
        validators=[
            DataRequired(message="Username is required."), 
            Length(min=3, max=64, message="Username must be between 3 and 64 characters."),
            Regexp(r'^[a-zA-Z0-9_]+$', message="Username can only contain letters, numbers, and underscores.")
        ]
    )
    first_name = StringField(
        'First Name',
        validators=[
            DataRequired(message="First name is required."), 
            Length(max=64, message="First name cannot exceed 64 characters."),
            Regexp(r'^[a-zA-Z\s-]+$', message="First name can only contain letters, spaces, and hyphens.")
        ]
    )
    last_name = StringField(
        'Last Name',
        validators=[
            DataRequired(message="Last name is required."), 
            Length(max=64, message="Last name cannot exceed 64 characters."),
            Regexp(r'^[a-zA-Z\s-]+$', message="Last name can only contain letters, spaces, and hyphens.")
        ]
    )
    email = StringField(
        'Email',
        validators=[
            DataRequired(message="Email is required."), 
            Email(message="Please enter a valid email address."),
            Length(max=255, message="Email cannot exceed 255 characters.")
        ]
    )
    phone = StringField(
        'Phone Number',
        validators=[
            DataRequired(message="Phone number is required."),
            Length(min=7, max=20, message="Phone number must be between 7 and 20 characters."),
            Regexp(r'^\+?1?\d{9,15}$', message="Please enter a valid phone number (e.g., +1234567890).")
        ]
    )
    date_birth = DateField(
        'Date of Birth',
        format='%Y-%m-%d',
        validators=[
            DataRequired(message="Date of birth is required.")
        ]
    )
    gender = SelectField(
        'Gender',
        choices=[(choice.value, choice.name.replace('_', ' ').title()) for choice in GenderEnum],
        validators=[DataRequired(message="Gender is required.")]
    )
    password = PasswordField(
        'Password',
        validators=[
            DataRequired(message="Password is required."),
            Length(min=8, message="Password must be at least 8 characters long."),
            Regexp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$',
                  message="Password must contain at least one letter, one number, and one special character.")
        ]
    )
    password_confirm = PasswordField(
        'Confirm Password',
        validators=[
            DataRequired(message="Please confirm your password."),
            EqualTo('password', message='Passwords must match.')
        ]
    )

    def validate_username(self, field):
        """Custom validator for username uniqueness"""
        if User.query.filter_by(username=field.data).first():
            raise ValidationError('This username is already taken. Please choose another one.')

    def validate_email(self, field):
        """Custom validator for email uniqueness"""
        if User.query.filter_by(email=field.data).first():
            raise ValidationError('This email is already registered. Please use a different email or try logging in.')

    def validate_phone(self, field):
        """Custom validator for phone uniqueness"""
        if User.query.filter_by(phone=field.data).first():
            raise ValidationError('This phone number is already registered. Please use a different number.')

    def validate_date_birth(self, field):
        """Custom validator for date of birth"""
        if field.data:
            today = datetime.utcnow().date()
            age = today.year - field.data.year - ((today.month, today.day) < (field.data.month, field.data.day))
            if age < 13:
                raise ValidationError('You must be at least 13 years old to register.')
            if age > 120:
                raise ValidationError('Please enter a valid date of birth.')

    def to_dict(self, only_user=True):
        """
        Return form data as dictionary
        :param only_user: bool, if True then only fields that have
        corresponding members in UserModel are returned
        :return: dict
        """
        def is_field_and_user_attr(member):
            if not isinstance(member, Field):
                return False

            # If only fields recorded on UserModel should be returned,
            # perform check on user model, else return True
            if only_user is True:
                return hasattr(User, member.name)
            else:
                return True

        fields = inspect.getmembers(self, is_field_and_user_attr)
        return {key: value.data for key, value in fields}

class ResetPasswordRequestForm(FlaskForm):
    email = StringField('Email', validators=[DataRequired(), Email()])
    submit = SubmitField('Request Password Reset')

class ResetPasswordForm(FlaskForm):
    password = PasswordField('Password', validators=[DataRequired(), Length(min=6)])
    password2 = PasswordField('Repeat Password', validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Reset Password')