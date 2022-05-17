# from app import db
from sqlalchemy import delete

from app import Session
from app.domain import UserRefreshToken


def add_user_token(user_refresh_token):
	with Session.begin() as session:
		session.add(user_refresh_token)


def has_user_token(user_refresh_token):
	with Session.begin() as session:
		return session.query(UserRefreshToken) \
						.filter(UserRefreshToken.username == user_refresh_token.username) \
						.filter(UserRefreshToken.token == user_refresh_token.token) \
						.one() is not None


def delete_user_token(user_refresh_token):
	with Session.begin() as session:
		session.execute(
			delete(UserRefreshToken).where(UserRefreshToken.token == user_refresh_token.token)
		)
