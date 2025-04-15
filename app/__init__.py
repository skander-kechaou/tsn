import os

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_socketio import SocketIO
from flask_user import UserManager
from .config import Config

db = SQLAlchemy()
migrate = Migrate()
socketio = SocketIO()
user_manager = None  # will be set after app and models are available

def create_app(config_class=Config):
    base_dir = os.path.abspath(os.path.dirname(__file__))
    template_dir = os.path.join(base_dir, '..', 'templates')

    app = Flask(__name__, template_folder=template_dir)
    app.config.from_object(config_class)


    db.init_app(app)
    migrate.init_app(app, db)
    socketio.init_app(app)

    from .main.routes import bp as main_bp
    from .profile.routes import bp as profile_bp
    from .connections.routes import bp as connections_bp

    app.register_blueprint(main_bp)
    app.register_blueprint(profile_bp)
    app.register_blueprint(connections_bp)

    # initialize Flask-User for authentication
    from .models import User
    global user_manager
    user_manager = UserManager(app, db, User)

    return app
