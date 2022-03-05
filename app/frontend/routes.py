import flask_login
from flask import render_template, request, make_response, jsonify
from flask_login import login_required, current_user

from . import frontend_bp
from ..admin.models import Forecast, Match, Comment


@frontend_bp.route("/", methods=['GET'])
def index():
    top_tuple_forecast = Forecast.get_more_match()
    array_id_match = []
    for match in top_tuple_forecast:
        array_id_match.append(match[0])
    top_forecast = Match.get_by_array_id(array_id_match)
    return render_template("index.html", top_forecast=list(top_forecast))


@frontend_bp.route("/liga-santander", methods=['GET'])
def league_santander():
    return render_template("league.html")


@frontend_bp.route("/liga-premier", methods=['GET'])
def league_premier():
    return render_template("league.html")


@frontend_bp.route("/match/<int:match_id>/", methods=['GET'])  # TODO validate errors
def match_detail(match_id):
    match = Match.get_by_match_id(match_id)
    if match:
        forecasts = Forecast.get_by_match_id(match.id)
        comments = Comment.get_by_match_id(match.id)
        return render_template("match_detail.html", match=match, forecasts=forecasts, comments=comments)
    return render_template("error/404.html")


@frontend_bp.route("/match/create_comment/", methods=['POST'])
@login_required
def create_comment():
    match_id = request.values.get('match_id')
    content = request.values.get('content')
    user_id = getattr(current_user, 'id', False)

    if Match.get_by_id(match_id):
        comment = Comment(user_id, match_id, content)
        comment.save()
        respond = make_response(jsonify({'status': 'success'}), 200)
    else:
        respond = make_response(jsonify({'status': 'not_found'}), 404)
    return respond


@frontend_bp.route("/match/create_forecast/", methods=['POST'])
@login_required
def create_forecast():
    match_id = request.values.get('match_id')
    user_id = getattr(current_user, 'id', False)
    forecast_match = Forecast.get_by_user_id_match_id(user_id, match_id)

    if Match.get_by_id(match_id):
        if forecast_match:
            respond = make_response(jsonify({'status': 'duplicate'}), 202)
        else:
            team_1_score = request.values.get('team_1_score')
            team_2_score = request.values.get('team_2_score')
            forecast = Forecast(user_id, match_id, team_1_score, team_2_score)
            forecast.save()
            respond = make_response(jsonify({'status': 'success'}), 200)
    else:
        respond = make_response(jsonify({'status': 'not_found'}), 404)
    return respond
