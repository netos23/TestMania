import bcrypt as bcrypt

import app.repository as repository
from app.domain import User
from app.exception import IllegalRequestFormat


def map_user_from_dto(user_dto):
	user_id = user_dto.id if hasattr(user_dto, 'id') else None
	username = user_dto.username if hasattr(user_dto, 'username') else None
	password = user_dto.password if hasattr(user_dto, 'password') else None

	if password is not None:
		password = bcrypt.hashpw(bytes(password.encode()), bcrypt.gensalt()).decode()

	return User(
		id=user_id,
		username=username,
		password_hash=password)


def add_user(user_dto):
	user = map_user_from_dto(user_dto)

	if user.username is None or user.password_hash is None:
		raise IllegalRequestFormat('Wrong user data!')

	repository.add_user(user)


def update_user(user_dto):
	user = map_user_from_dto(user_dto)

	if user.id is None or user.username is None or user.password_hash is None:
		raise IllegalRequestFormat('Wrong user data!')

	repository.update_user(user)


def delete_user(user_dto):
	user = map_user_from_dto(user_dto)

	if user.id is None:
		raise IllegalRequestFormat('Wrong user data!')

	repository.delete_user_by_id(user)


def login(user_dto):
	pass


def validate(token):
	pass


def refresh(token):
	pass
