from . import db
from flask_user import UserMixin


class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    active = db.Column('is_active', db.Boolean(), nullable=False, server_default='1')

    username = db.Column(db.String(64), nullable=False, unique=True)
    email = db.Column(db.String(255), nullable=True, unique=True)
    email_confirmed_at = db.Column(db.DateTime())

    password = db.Column(db.String(255), nullable=False)

    def __repr__(self):
        return f"<User {self.username}>"
