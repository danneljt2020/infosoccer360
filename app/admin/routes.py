import time
from datetime import datetime

from flask import render_template, abort, make_response, jsonify, request, redirect, url_for
from flask_login import login_required

from . import admin_bp
from .forms import UserAdminForm
from .models import Match, Comment, Forecast

from ..auth.decorators import admin_required
from ..auth.models import User
from ..admin.models import TableScore
from ..api.consumer import *


@admin_bp.route("/admin/")
@login_required
@admin_required
def dashboard():
    amount_users = len(User.get_all()) - 1
    forecast = len(Forecast.get_all())
    active_games = len(Match.get_active_games())
    comments = len(Comment.get_all())
    user_forecast = get_top_forecast_user(Forecast.get_more_user())
    stadistics = [10, 4, 3, 7, 5, 10, 3, 4, 8, 10, 6, 8]
    return render_template("admin/index.html", amount_users=amount_users, stadistics=stadistics,
                           forecast=forecast, active_games=active_games, comments=comments,
                           user_forecast=list(user_forecast))


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


@admin_bp.route("/admin/forecast")
@login_required
@admin_required
def list_forecast():
    forecast_santander = Forecast.get_by_league('laliga-santander')
    forecast_premier = Forecast.get_by_league('premier-league')
    return render_template("admin/forecast/table_forecast.html", santander=forecast_santander,
                           premier=forecast_premier)


@admin_bp.route("/admin/moderation")
@login_required
@admin_required
def list_moderation():
    comments = Comment.get_all()
    return render_template("admin/moderation/moderation.html", comments=comments)


@admin_bp.route("/admin/user/update_state_comment/", methods=['PATCH'])
@login_required
@admin_required
def update_state_comment():
    id_comment = request.values.get('id_comment')
    state_comment = request.values.get('state')

    comment = Comment.get_by_id(id_comment)

    if comment is None:
        return make_response(jsonify({'status': 'error'}), 404)
    comment.state = True if state_comment == "1" else False
    comment.save()

    return make_response(jsonify({'status': 'success'}), 200)


@admin_bp.route("/admin/comment/delete/", methods=['DELETE'])
@login_required
@admin_required
def delete_comment():
    id_comment = request.values.get('id_comment')
    comment = Comment.get_by_id(id_comment)
    if comment is None:
        return make_response(jsonify({'status': 'error'}), 404)
    comment.delete()
    return make_response(jsonify({'status': 'success'}), 200)


@admin_bp.route("/admin/table_score")
@login_required
@admin_required
def tables_scores():
    santander_table = TableScore.get_by_league('laliga-santander')
    premier_table = TableScore.get_by_league('premier-league')
    return render_template("admin/table_score/table_score.html", santander_table=santander_table,
                           premier_table=premier_table)


@admin_bp.route("/admin/matches")
@login_required
@admin_required
def list_matches():
    santander_matches = Match.get_by_league_id('laliga-santander', "NS")
    premier_matches = Match.get_by_league_id('premier-league', "NS")
    return render_template("admin/match/list_match.html", santander=santander_matches,
                           premier=premier_matches, finish="no")


@admin_bp.route("/admin/finish-matches")
@login_required
@admin_required
def list_finish_matches():
    santander_matches = Match.get_by_league_id('laliga-santander', "FT")
    premier_matches = Match.get_by_league_id('premier-league', "FT")
    return render_template("admin/match/list_match_finish.html", santander=santander_matches,
                           premier=premier_matches, finish="yes")


# Update Table Score
@admin_bp.route("/admin/update_table_score", methods=['PATCH'])
@login_required
@admin_required
def update_table_score():
    table_data_santander = get_table_by_league("spain", "laliga-santander")
    time.sleep(2)
    table_data_premier = get_table_by_league("england", "premier-league")

    response = make_response(jsonify({"santander": "success", "premier": "success", 'status': 'success'}), 200)
    TableScore.delete_all()

    saved_santander = save_table_score(table_data_santander, "laliga-santander")
    saved_premier = save_table_score(table_data_premier, "premier-league")

    if not saved_premier:
        response = make_response(jsonify({"santander": "success", "premier": "fail", 'status': 'success'}), 200)

    if not saved_santander:
        response = make_response(jsonify({"santander": "fail", "premier": "success", 'status': 'success'}), 200)

    return response


# Update matches by league and round
@admin_bp.route("/admin/update_match_by_league", methods=['PATCH'])
@login_required
@admin_required
def update_match_by_league():
    country_code = request.values.get('country_code')
    round = request.values.get('round')
    league_code = request.values.get('league_code')
    response = make_response(jsonify({'status': 'success'}), 200)

    matches = get_matches_by_league("england", "premier-league", "38")
    saved = save_matches(matches, "premier-league")

    if not saved:
        response = make_response(jsonify({'status': 'error'}), 503)

    return response


# Update matches result by league and date
@admin_bp.route("/admin/update_match_by_league_date", methods=['PATCH'])
@login_required
@admin_required
def update_matches_result_by_league_date():
    date = request.values.get('date')
    league_code = request.values.get('league_code')

    response = make_response(jsonify({'status': 'success'}), 200)

    matches = get_matches_league_by_date(date, league_code)

    for match in matches:
        upd_match = Match.get_by_match_id(match['match_id'])
        if upd_match:
            upd_match.team_1_score = match['score']['full_time']['team_1']
            upd_match.team_2_score = match['score']['full_time']['team_2']
            upd_match.status = match['status']
            upd_match.save()

    return response


# Get results match by id TODO validate respond
@admin_bp.route("/admin/update_match_by_id", methods=['PATCH'])
@login_required
@admin_required
def update_match_by_id():
    match_id = request.values.get('match_id')

    response = make_response(jsonify({'status': match_id}), 200)

    match_detail = get_matches_by_id(match_id)

    if match_detail:
        upd_match = Match.get_by_match_id(match_id)
        if upd_match:
            upd_match.team_1_score = match_detail['team_1']['score']
            upd_match.team_2_score = match_detail['team_2']['score']
            upd_match.status = "FT"
            upd_match.save()

    return response


def save_table_score(data, league):
    flag = True
    if len(data) > 0:
        #   save in DB table score
        for row in data:
            row_score = TableScore(row['won'], row['team_name'], row['lost'], row['points'], row['team_id'],
                                   row['rank'], row['games_played'], league)
            row_score.save()
    else:
        flag = False

    return flag


def save_matches(data, league_id):
    flag = True
    if len(data) > 0:
        #   save in DB
        for row in data:
            date_str = str(row['time']['scheduled'])
            game_date = datetime(year=int(date_str[0:4]), month=int(date_str[4:6]), day=int(date_str[6:8]))
            row_match = Match(league_id, row['match_id'], row['round'], row['status'], row['team_1']['id'],
                              row['team_2']['id'], row['team_1']['name'], row['team_2']['name'], game_date)
            row_match.save()
    else:
        flag = False

    return flag


def get_top_forecast_user(tuple_user):
    data = []
    for tuple_u in tuple_user:
        name = User.get_by_id(tuple_u[0]).name
        data.append((name, tuple_u[1]))
    return data


