from datetime import datetime
from app import db


class TableScore(db.Model):
    __tablename__ = 'table_score'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=datetime.utcnow)
    won = db.Column(db.String(60), nullable=True)
    team_name = db.Column(db.String(256), nullable=True)
    lost = db.Column(db.String(60), nullable=True)
    points = db.Column(db.String(60), nullable=True)
    team_id = db.Column(db.String(60), nullable=True)
    rank = db.Column(db.String(60), nullable=True)
    games_played = db.Column(db.String(60), nullable=True)
    league = db.Column(db.String(60), nullable=True)

    def __init__(self, won, team_name, lost, points, team_id, rank, games_played, league):
        self.won = won
        self.team_name = team_name
        self.lost = lost
        self.points = points
        self.team_id = team_id
        self.rank = rank
        self.games_played = games_played
        self.league = league

    def save(self):
        if not self.id:
            db.session.add(self)
        db.session.commit()

    @staticmethod
    def delete_all():
        db.session.query(TableScore).delete()
        db.session.commit()

    @staticmethod
    def get_by_id(id):
        return TableScore.query.get(id)

    @staticmethod
    def get_by_league(league_param):
        table = db.session.query(TableScore).filter(TableScore.league == league_param).all()
        return table

    @staticmethod
    def get_all():
        return TableScore.query.all()
