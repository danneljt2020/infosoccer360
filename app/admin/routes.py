from flask import render_template, abort, make_response, jsonify, request
from flask_login import login_required

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


@admin_bp.route("/admin/user/delete/", methods=['DELETE'])
@login_required
@admin_required
def delete_user():
    user_id = request.values.get('id_user')
    user = User.get_by_id(user_id)
    if user is None:
        return make_response(jsonify({'status': 'error'}), 404)
    user.delete()
    return make_response(jsonify({'status': 'success'}), 200)


@admin_bp.route("/admin/moderation")
@login_required
@admin_required
def list_moderation():
    return render_template("admin/moderation/moderation.html")