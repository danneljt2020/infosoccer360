from flask import Flask, render_template
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_mail import Mail

login_manager = LoginManager()
db = SQLAlchemy()
migrate = Migrate()
mail = Mail()


def create_app():
    app = Flask(__name__)

    app.config['SECRET_KEY'] = '7110c8ae51a4b5af97be6534caef90e4bb9bdcb3380af008f90b23a5d1616bf319bc298105da20fe'
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://admin:admin@localhost:5432/infosoccer'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    login_manager.init_app(app)
    login_manager.login_view = "auth.login"

    db.init_app(app)
    migrate.init_app(app, db)
    mail.init_app(app)

    # Registro de los Blueprints
    from .auth import auth_bp
    app.register_blueprint(auth_bp)

    from .admin import admin_bp
    app.register_blueprint(admin_bp)

    from .public import public_bp
    app.register_blueprint(public_bp)

    # Custom error handlers
    register_error_handlers(app)

    return app


def register_error_handlers(app):
    @app.errorhandler(500)
    def base_error_handler(e):
        return render_template('error/500.html'), 500

    @app.errorhandler(404)
    def error_404_handler(e):
        return render_template('error/404.html'), 404

    @app.errorhandler(401)
    def error_401_handler(e):
        return render_template('error/401.html'), 401
