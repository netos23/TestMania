import json
from types import SimpleNamespace

from flask import request, jsonify

from app import app
from app import service as auth_service
from app.dto import SuccessResponse, TokensResponse


@app.route('/add', methods=['POST'])
def add_user():
	user_dto = json.loads(request.data, object_hook=lambda d: SimpleNamespace(**d))
	auth_service.add_user(user_dto)

	return jsonify(SuccessResponse.build_ok().__dict__)


@app.route('/edit', methods=['POST'])
def edit_user():
	user_dto = json.loads(request.data, object_hook=lambda d: SimpleNamespace(**d))
	auth_service.update_user(user_dto)

	return jsonify(SuccessResponse.build_ok().__dict__)


@app.route('/remove', methods=['POST'])
def remove_user():
	user_dto = json.loads(request.data, object_hook=lambda d: SimpleNamespace(**d))
	auth_service.delete_user(user_dto)

	return jsonify(SuccessResponse.build_ok().__dict__)


@app.route('/login', methods=['POST'])
def login():
	user_dto = json.loads(request.data, object_hook=lambda d: SimpleNamespace(**d))
	access, refresh = auth_service.login(user_dto)

	return jsonify(TokensResponse(access, refresh).__dict__)


@app.route('/validate')
def validate_token():
	token = request.headers.get('Authentication')
	auth_service.validate(token)

	return jsonify(SuccessResponse.build_ok().__dict__)


@app.route('/refresh')
def refresh_token():
	token_dto = json.loads(request.data, object_hook=lambda d: SimpleNamespace(**d))
	new_token = auth_service.refresh(token_dto)

	return jsonify(new_token.__dict__)
