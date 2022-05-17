from sqlalchemy import delete

# from app import db
from app import Session
from app.domain import User


def add_user(user):
	with Session.begin() as session:
		session.add(user)


def find_user_by_id(user_id):
	with Session.begin() as session:
		return session.get(User, user_id)


def find_user_by_username(username):
	with Session.begin() as session:
		return session.query(User) \
			.filter(User.username == username) \
			.one()


def update_user(updated_user):
	with Session.begin() as session:
		user = session.query(User) \
			.filter(User.id == updated_user.id) \
			.one()

		user.username = updated_user.username
		user.password_hash = updated_user.password_hash

		session.flush()


def delete_user_by_id(user):
	with Session.begin() as session:
		session.execute(
			delete(User).where(User.id == user.id)
		)
