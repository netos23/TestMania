from app import db


class User(db.Model):
	db.Model.__tablename__ = "user_account"

	id = db.Column(db.Integer, primary_key=True)
	username = db.Column(db.String(30))
	password_hash = db.Column(db.String(30))
