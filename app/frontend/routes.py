from flask import render_template
from . import frontend_bp


@frontend_bp.route("/")
def index():
    return render_template("index.html", methods=['GET'])


@frontend_bp.route("/liga-santander", methods=['GET'])
def league_santander():
    return render_template("league.html")


@frontend_bp.route("/liga-premier", methods=['GET'])
def league_premier():
    return render_template("league.html")


@frontend_bp.route("/match/<int:match_id>/", methods=['GET'])
def match_detail(match_id):
    return render_template("match_detail.html")
