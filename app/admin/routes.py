from flask import render_template, abort, make_response, jsonify, request, redirect, url_for
from flask_login import login_required

from . import admin_bp
from .forms import UserAdminForm

from ..auth.decorators import admin_required
from ..auth.models import User
from ..admin.models import TableScore
from ..api.consumer import *


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


@admin_bp.route("/admin/user/update_state/", methods=['PATCH'])
@login_required
@admin_required
def update_state_user():
    user_id = request.values.get('id_user')
    state = request.values.get('state')

    user = User.get_by_id(user_id)

    if user is None:
        return make_response(jsonify({'status': 'error'}), 404)
    user.state = True if state == "1" else False
    user.save()

    return make_response(jsonify({'status': 'success'}), 200)


@admin_bp.route("/admin/user/<int:user_id>/", methods=['GET', 'POST'])
@login_required
@admin_required
def update_user_form(user_id):
    user = User.get_by_id(user_id)
    if user is None:
        abort(404)
    form = UserAdminForm(obj=user)
    if form.validate_on_submit():
        user.name = form.name.data
        user.last = form.last.data
        user.phone = form.phone.data
        user.is_moderator = form.is_moderator.data
        user.state = form.state.data
        user.is_admin = form.is_admin.data
        user.save()
        return redirect(url_for('admin.list_users'))
    return render_template("admin/users/update_form.html", form=form, user=user)


@admin_bp.route("/admin/moderation")
@login_required
@admin_required
def list_moderation():
    return render_template("admin/moderation/moderation.html")


@admin_bp.route("/admin/update_table_score", methods=['GET'])
@login_required
@admin_required
def update_table_score():
    # country_code = request.values.get('country_code')
    # league_code = request.values.get('league_code')

    table_data = get_table_by_league('spain', 'laliga-santander')
    if len(table_data) > 0:
        response = make_response(jsonify({'status': 'success'}), 200)
    #   save in DB table score
        for row in table_data:
            row_score = TableScore(row['won'], row['team_name'], row['lost'], row['points'], row['team_id'], row['rank'], row['games_played'])
            row_score.save()
    else:
        response = make_response(jsonify({'status': 'error'}), 503)

    return response
