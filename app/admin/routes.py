from flask import render_template, redirect, url_for, abort
from flask_login import login_required, current_user
from sqlalchemy.orm import session

from . import admin_bp
from ..auth.decorators import admin_required
from ..auth.models import User


@admin_bp.route("/admin/")
@login_required
@admin_required
def dashboard():
    amount_users = len(User.get_all())-1
    stadistics = [10, 4, 3, 7, 5, 10, 3, 4, 8, 10, 6, 8]
    return render_template("admin/index.html", amount_users=amount_users, stadistics=stadistics)


@admin_bp.route("/admin/users")
@login_required
@admin_required
def list_users():
    users = User.get_all()
    return render_template("admin/users/list_users.html", users=users)


@admin_bp.route("/admin/moderation")
@login_required
@admin_required
def list_moderation():
    return render_template("admin/moderation/moderation.html")