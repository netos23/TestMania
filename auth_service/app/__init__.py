from flask import Flask
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy



app = Flask(__name__)
app.config.from_object('config')
db = SQLAlchemy(app)
migrate = Migrate(app, db, render_as_batch=True)
Session = db.create_session({})

from . import auth_controller
from . import exeption_handler
