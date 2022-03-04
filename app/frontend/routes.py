from flask import render_template
from . import frontend_bp
from ..admin.models import Forecast, Match


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


@frontend_bp.route("/match/<int:match_id>/", methods=['GET'])
def match_detail(match_id):
    return render_template("match_detail.html")
