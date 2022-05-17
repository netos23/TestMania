from sqlalchemy import delete

# from app import db
from app.domain import User


class UserRepository:
	def __init__(self, session_maker):
		self.session_maker = session_maker

	def add_user(self, user):
		self.session_maker.current_session().add(user)

	def find_user_by_id(self, user_id):
		return self.session_maker.current_session().get(User, user_id)

	def find_user_by_username(self, username):
		return self.session_maker.current_session().query(User) \
			.filter(User.username == username) \
			.one_or_none()

	def update_user(self, updated_user):
		user = self.session_maker.current_session().query(User) \
			.filter_by(id=updated_user.id) \
			.one_or_none()

		user.username = updated_user.username
		user.password_hash = updated_user.password_hash

		self.session_maker.current_session().flush()

	def delete_user_by_id(self, user):
		self.session_maker.current_session().execute(
			delete(User).where(User.id == user.id)
		)

	def delete_user_by_username(self, user):
		self.session_maker.current_session().execute(
			delete(User).where(User.username == user.username)
		)
