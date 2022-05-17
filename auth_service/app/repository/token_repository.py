# from app import db
from sqlalchemy import delete

from app.domain import UserRefreshToken


class UserRefreshTokenRepository:
	def __init__(self, session_maker):
		self.session_maker = session_maker

	def add_user_token(self, user_refresh_token):
		self.session_maker.current_session().add(user_refresh_token)

	def has_user_token(self, user_refresh_token):
		return self.session_maker.current_session().query(UserRefreshToken) \
					.filter(UserRefreshToken.username == user_refresh_token.username) \
					.filter(UserRefreshToken.token == user_refresh_token.token) \
					.one() is not None

	def delete_user_token(self, user_refresh_token):
		self.session_maker.current_session().execute(
			delete(UserRefreshToken).where(UserRefreshToken.token == user_refresh_token.token)
		)
