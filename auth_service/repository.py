from sqlalchemy import delete
from sqlalchemy.orm import sessionmaker

from app import db
from domain import User

engine = None
Session = None


def setup_database():
	global engine, Session
	db.drop_all(engine)
	db.create_all(engine)
	Session = sessionmaker(db.engine)


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


def update_user(user_dto):
	with Session.begin() as session:
		user = session.query(User) \
			.filter(User.id == user_dto.id) \
			.one()

		user.username = user_dto.username
		user.password_hash = user_dto.password_hash

		session.flush()


def delete_user_by_id(id):
	with Session.begin() as session:
		session.execute(
			delete(User).where(User.id == id)
		)
