from . import public_bp


@public_bp.route("/")
def index():
    return "Hola"

