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


class Comment(db.Model):
    __tablename__ = 'comment'

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id', ondelete='CASCADE'), nullable=False)
    match_id = db.Column(db.Integer, db.ForeignKey('match.id', ondelete='CASCADE'), nullable=False)
    content = db.Column(db.String(400), nullable=True)
    created = db.Column(db.DateTime, default=datetime.utcnow)
    state = db.Column(db.Boolean, default=False)
    reply = db.Column(db.Boolean, default=False)

    def __init__(self, content, ):
        self.content = content

    def save(self):
        if not self.id:
            db.session.add(self)
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    @staticmethod
    def get_by_id(id):
        return Comment.query.get(id)

    @staticmethod
    def get_by_user_id(user_id):
        return Comment.query.filter_by(user_id=user_id).all()

    @staticmethod
    def get_all():
        return Comment.query.all()


class Match(db.Model):
    __tablename__ = 'match'

    id = db.Column(db.Integer, primary_key=True)
    league_id = db.Column(db.String(80), nullable=True)
    match_id = db.Column(db.String(80), nullable=True)
    round = db.Column(db.String(80), nullable=True)
    status = db.Column(db.String(80), nullable=True)
    team_1_id = db.Column(db.String(80), nullable=True)
    team_2_id = db.Column(db.String(80), nullable=True)
    team_1_name = db.Column(db.String(80), nullable=True)
    team_2_name = db.Column(db.String(80), nullable=True)
    team_1_score = db.Column(db.String(80), nullable=True)
    team_2_score = db.Column(db.String(80), nullable=True)
    created = db.Column(db.DateTime, default=datetime.utcnow)
    start = db.Column(db.DateTime, default=datetime.utcnow)

    def __init__(self):
        pass

    def save(self):
        if not self.id:
            db.session.add(self)
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    @staticmethod
    def get_by_id(id):
        return Match.query.get(id)

    @staticmethod
    def get_all():
        return Match.query.all()


class Forecast(db.Model):
    __tablename__ = 'forecast'

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id', ondelete='CASCADE'), nullable=False)
    match_id = db.Column(db.Integer, db.ForeignKey('match.id', ondelete='CASCADE'), nullable=False)
    team_1_score = db.Column(db.String(80), nullable=True)
    team_2_score = db.Column(db.String(80), nullable=True)
    created = db.Column(db.DateTime, default=datetime.utcnow)
    note = db.Column(db.String(400), nullable=True)

    def __init__(self, content, ):
        self.content = content

    def save(self):
        if not self.id:
            db.session.add(self)
        db.session.commit()

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    @staticmethod
    def get_by_id(id):
        return Forecast.query.get(id)

    @staticmethod
    def get_by_user_id(user_id):
        return Forecast.query.filter_by(user_id=user_id).all()

    @staticmethod
    def get_all():
        return Forecast.query.all()



