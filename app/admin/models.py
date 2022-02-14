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
    state = db.Column(db.Boolean, default=False)
    reply = db.Column(db.Boolean, default=False)
    created = db.Column(db.DateTime, default=datetime.utcnow)

    def __init__(self, user_id,match_id,content ):
        self.user_id = user_id
        self.match_id = match_id
        self.content = content

    def save(self):
        if not self.id:
            db.session.add(self)
        db.session.commit()

    # def user(self):
    #     return User.query.get(self.user_id)

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
    start = db.Column(db.DateTime, default=datetime.utcnow)
    created = db.Column(db.DateTime, default=datetime.utcnow)
    comment = db.relationship('Comment', backref='match', lazy=True, uselist=False)

    def __init__(self, league_id, match_id, round, status, team_1_id, team_2_id, team_1_name, team_2_name, start):
        self.league_id = league_id
        self.match_id = match_id
        self.round = round
        self.status = status
        self.team_1_id = team_1_id
        self.team_2_id = team_2_id
        self.team_1_name = team_1_name
        self.team_2_name = team_2_name
        self.team_1_score = "0"
        self.team_2_score = "0"
        self.start = start

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

    @staticmethod
    def get_by_league_id(league_id):
        return Match.query.filter_by(league_id=league_id).all()


class Forecast(db.Model):
    __tablename__ = 'forecast'

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id', ondelete='CASCADE'), nullable=False)
    match_id = db.Column(db.Integer, db.ForeignKey('match.id', ondelete='CASCADE'), nullable=False)
    team_1_score = db.Column(db.String(80), nullable=True)
    team_2_score = db.Column(db.String(80), nullable=True)
    created = db.Column(db.DateTime, default=datetime.utcnow)
    note = db.Column(db.String(400), nullable=True)

    def __init__(self, user_id, match_id, team_1_score, team_2_score, note):
        self.user_id = user_id
        self.match_id = match_id
        self.team_1_score = team_1_score
        self.team_2_score = team_2_score
        self.note = note

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
