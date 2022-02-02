from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, BooleanField
from wtforms.validators import DataRequired, Email, Length, EqualTo


class SignupForm(FlaskForm):
    name = StringField('Nombre', validators=[DataRequired('Este campo es requerido.'), Length(max=64)])
    last = StringField('Apellido', validators=[DataRequired('Este campo es requerido.'), Length(max=64)])
    phone = StringField('Teléfono', validators=[DataRequired('Este campo es requerido.'), Length(max=64)])
    password = PasswordField('Contraseña', validators=[DataRequired('Este campo es requerido.'),
                                                       Length(min=6, message='La contraseña debe tener al menos 6 caracteres.')])
    password2 = PasswordField('Repite contraseña', validators=[DataRequired('Este campo es requerido.'),
                                                               EqualTo('password', 'Las contraseñas no coinciden.'),
                                                               Length(min=6, message='La contraseña debe tener al menos 6 caracteres.')])
    email = StringField('Email', validators=[DataRequired('Este campo es requerido.'),
                                             Email('El correo introducido no es correcto.')])
    submit = SubmitField('Registrarse')


class LoginForm(FlaskForm):
    email = StringField('Email', validators=[DataRequired('Este campo es requerido.')])
    password = PasswordField('Password', validators=[DataRequired('Este campo es requerido.')])
    remember_me = BooleanField('Recuérdame')
    submit = SubmitField('Login')
