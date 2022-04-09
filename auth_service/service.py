import bcrypt as bcrypt

import repository
from domain import User


def add_user(user_dto):
	user = User(
		id=user_dto.id,
		username=user_dto.username,
		password_hash=bcrypt.hashpw(user_dto.password, bcrypt.gensalt()))
	repository.add_user(user)


def edit_user(user_dto):
	pass


def remove_user(user_dto):
	pass


def login(user_dto):
	pass


def validate(token):
	pass
