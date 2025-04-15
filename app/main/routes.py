# app/main/routes.py
from flask import Blueprint, render_template
from flask_user import login_required

bp = Blueprint('main', __name__, template_folder='templates')

@bp.route('/')
def index():
    return render_template('main/index.html')

@bp.route('/dashboard')
@login_required
def dashboard():
    # Here, you can query for recent activities, friend suggestions, etc.
    return render_template('main/dashboard.html')
