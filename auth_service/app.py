from flask import Flask
from flask_sqlalchemy import SQLAlchemy

from auth_controller import auth_rest_controller
from repository import setup_database

app = Flask(__name__)
app.config.from_object('config')
db = SQLAlchemy(app)
app.register_blueprint(auth_rest_controller)

if __name__ == '__main__':
	app.run()
	setup_database()
