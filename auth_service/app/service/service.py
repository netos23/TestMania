import time
from math import floor

import bcrypt as bcrypt
import jwt

from app import app
from app.domain import User, UserRefreshToken
from app.exception import IllegalRequestFormatException, AccessDeniedException
from app.repository import session_controller
from app.repository import token_repo as token_repository
from app.repository import user_repo as user_repository


def map_user_from_dto(user_dto):
	user_id = user_dto.id if hasattr(user_dto, 'id') else None
	username = user_dto.username if hasattr(user_dto, 'username') else None
	password = user_dto.password if hasattr(user_dto, 'password') else None

	return User(
		id=user_id,
		username=username,
		password_hash=password)


def map_token_from_dto(refresh_token_dto):
	return refresh_token_dto.token


def add_user(user_dto):
	session_controller.begin_session()

	user = map_user_from_dto(user_dto)

	if user.username is None or user.password_hash is None:
		raise IllegalRequestFormatException('Wrong user data!')

	if user_repository.find_user_by_username(user.username) is not None:
		raise IllegalRequestFormatException('User exits')

	user.password_hash = bcrypt.hashpw(bytes(user.password_hash.encode()), bcrypt.gensalt()).decode()
	user_repository.add_user(user)
	session_controller.end_session()


def update_user(user_dto):
	session_controller.begin_session()

	user = map_user_from_dto(user_dto)

	if user.id is None or user.username is None or user.password_hash is None:
		raise IllegalRequestFormatException('Wrong user data!')

	if user_repository.find_user_by_username(user.username) is not None:
		raise IllegalRequestFormatException('User exits')

	user.password_hash = bcrypt.hashpw(bytes(user.password_hash.encode()), bcrypt.gensalt()).decode()
	user_repository.update_user(user)
	session_controller.end_session()


def delete_user(user_dto):
	session_controller.begin_session()

	user = map_user_from_dto(user_dto)

	if user.username is None:
		raise IllegalRequestFormatException('Wrong user data!')

	user_repository.delete_user_by_username(user)
	session_controller.end_session()


def login(user_dto):
	session_controller.begin_session()

	user = map_user_from_dto(user_dto)
	user_from_db = user_repository.find_user_by_username(user.username)

	if user_from_db is None:
		session_controller.end_session()
		raise AccessDeniedException('Wrong user data!')

	password = bytes(user.password_hash.encode())
	hashed_password = user_from_db.password_hash.encode()
	if not bcrypt.checkpw(password, hashed_password):
		raise AccessDeniedException('Wrong user data!')

	access_token, refresh_token = gen_and_save_token_pair(user)
	session_controller.end_session()
	return access_token, refresh_token


def gen_and_save_token_pair(user):
	access_token, refresh_token = gen_token_pair(user)
	token_repository.add_user_token(UserRefreshToken(id=None, username=user.username, token=refresh_token))
	return access_token, refresh_token


def gen_token_pair(user):
	access_life_len = app.config['ACCESS_TOKEN_LIFE_LENGTH']
	refresh_life_len = app.config['REFRESH_TOKEN_LIFE_LENGTH']
	access_secret = app.config['ACCESS_TOKEN_SECRET']
	refresh_secret = app.config['REFRESH_TOKEN_SECRET']
	access_token = gen_token(access_life_len, user.username, access_secret)
	refresh_token = gen_token(refresh_life_len, user.username, refresh_secret)
	return access_token, refresh_token


def gen_token(life_len, username, secret):
	expired = int(floor(time.time() + life_len))
	payload = {
		"username": username,
		"exp": expired,
	}
	return jwt.encode(payload, secret, algorithm="HS256")


def extract_token(token: str):
	if not token.startswith('Bearer '):
		raise IllegalRequestFormatException('Wrong token format')

	return token[7:]


def validate(token):
	session_controller.begin_session()
	access_token = extract_token(token)

	try:
		validate_token(access_token, app.config['ACCESS_TOKEN_SECRET'])
	except Exception:
		session_controller.end_session()
		raise AccessDeniedException('Invalid or expired token')

	session_controller.end_session()


def validate_token(token, key):
	return jwt.decode(token, key, algorithms=["HS256"], options={'verify_exp': True})


def refresh(refresh_token_dto):
	session_controller.begin_session()
	refresh_token = map_token_from_dto(refresh_token_dto)

	try:
		payload = validate_token(refresh_token, app.config['REFRESH_TOKEN_SECRET'])
	except Exception:
		session_controller.end_session()
		raise AccessDeniedException('Invalid or expired token')

	username = payload['username']
	user_refresh_token = UserRefreshToken(username=username, token=refresh_token)

	if not token_repository.has_user_token(user_refresh_token):
		session_controller.end_session()
		raise AccessDeniedException('Invalid or expired token')

	token_repository.delete_user_token(user_refresh_token)
	user = user_repository.find_user_by_username(username)

	access_token, refresh_token = gen_and_save_token_pair(user)
	session_controller.end_session()
	return access_token, refresh_token
