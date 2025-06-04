from flask import Blueprint, jsonify
from flask_security import login_required # New import from Flask-Security

bp = Blueprint('routes', __name__, template_folder='templates')

@bp.route('/')
def index():
    return "Welcome to your TSN platform!"

@bp.route('/users', methods=['GET'])
def get_users():
    # Logic to fetch and return users from PostgreSQL
    return jsonify({"msg": "List of users"})

@bp.route('/dashboard')
@login_required
def dashboard():
    return "User Dashboard"

