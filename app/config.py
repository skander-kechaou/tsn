import os


class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY', 'a-very-secret-key')
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL', 'postgresql://postgres:password@localhost:5432/tsn_db')
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    USER_APP_NAME = "TSN Platform"
    USER_ENABLE_EMAIL = False  # set to True to use email confirmation
    USER_ENABLE_USERNAME = True
    USER_REQUIRE_RETYPE_PASSWORD = False  # USER_REQUIRE_EMAIL = True
