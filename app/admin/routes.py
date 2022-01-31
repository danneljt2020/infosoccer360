from flask import render_template, redirect, url_for, abort
from flask_login import login_required, current_user

from . import admin_bp
from ..auth.decorators import admin_required
from ..auth.models import User


@admin_bp.route("/admin/")
@login_required
@admin_required
def dashboard():
    return render_template("admin/index.html")
