from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, TextAreaField, BooleanField
from wtforms.validators import DataRequired, Length


class UserAdminForm(FlaskForm):
    name = StringField('Nombre', validators=[DataRequired('Este campo es requerido.'), Length(max=64)])
    last = StringField('Apellido', validators=[DataRequired('Este campo es requerido.'), Length(max=64)])
    phone = StringField('Teléfono', validators=[DataRequired('Este campo es requerido.'), Length(max=64)])
    is_admin = BooleanField('is Administrador')
    is_moderator = BooleanField('is Moderator')
    state = BooleanField('State')
    submit = SubmitField('Guardar')