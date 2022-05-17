import time

import bcrypt as bcrypt
import jwt

import app.repository.token_repository as token_repository
import app.repository.user_repository as user_repository
from app import app
from app.domain import User, UserRefreshToken
from app.exception import IllegalRequestFormatException, AccessDeniedException


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


def map_token_from_dto(refresh_token_dto):
	return refresh_token_dto.token


def add_user(user_dto):
	user = map_user_from_dto(user_dto)

	if user.username is None or user.password_hash is None:
		raise IllegalRequestFormatException('Wrong user data!')

	user_repository.add_user(user)


def update_user(user_dto):
	user = map_user_from_dto(user_dto)

	if user.id is None or user.username is None or user.password_hash is None:
		raise IllegalRequestFormatException('Wrong user data!')

	user_repository.update_user(user)


def delete_user(user_dto):
	user = map_user_from_dto(user_dto)

	if user.id is None:
		raise IllegalRequestFormatException('Wrong user data!')

	user_repository.delete_user_by_id(user)


def login(user_dto):
	user = map_user_from_dto(user_dto)
	user_from_db = user_repository.find_user_by_username(user.username)

	if user_from_db is None or user_from_db.passwrord_hash != user.password_hash:
		raise AccessDeniedException('Wrong user data!')

	return gen_and_save_token_pair(user)


def gen_and_save_token_pair(user):
	access_token, refresh_token = gen_token_pair(user)
	token_repository.add_user_token(UserRefreshToken(user.username, refresh_token))
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
	expired = time.time() + life_len
	payload = {
		"username": username,
		"exp": expired,
	}
	return jwt.encode(payload, secret, algorithm="HS256")


def extract_token(token: str):
	if not token.startswith('Bearer '):
		raise IllegalRequestFormatException('Wrong token format')

	return token[8:]


def validate(token):
	access_token = extract_token(token)
	validate_token(access_token, app.config['ACCESS_TOKEN_SECRET'])


def validate_token(token, key):
	try:
		return jwt.decode(token, key, options={'verify_exp': True})
	except Exception:
		raise AccessDeniedException('Invalid or expired token')


def refresh(refresh_token_dto):
	refresh_token = map_token_from_dto(refresh_token_dto)
	payload = validate_token(refresh_token, app.config['REFRESH_TOKEN_SECRET'])

	username = payload['username']
	user_refresh_token = UserRefreshToken(username=username, token=refresh_token)

	if not token_repository.has_user_token(user_refresh_token):
		raise AccessDeniedException('Invalid or expired token')

	token_repository.delete_user_token(user_refresh_token)
	user = user_repository.find_user_by_username(username)
	return gen_and_save_token_pair(user)