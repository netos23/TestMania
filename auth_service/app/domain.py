from app import db


class User(db.Model):
	db.Model.__tablename__ = "user_account"

	id = db.Column(db.Integer, primary_key=True)
	username = db.Column(db.String(30), unique=True)
	password_hash = db.Column(db.String(30))


class UserRefreshToken(db.Model):
	db.Model.__tablename__ = "user_account_tokens"

	id = db.Column(db.Integer, primary_key=True)
	username = db.Column(db.String(30))
	token = db.Column(db.String(256), unique=True)
