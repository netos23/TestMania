import json
from types import SimpleNamespace

from flask import Blueprint, request, jsonify

import service as auth_service

auth_rest_controller = Blueprint('auth_controller', __name__)


@auth_rest_controller.route('/add', methods=['POST'])
def add_user():
	user_dto = json.loads(request.data, object_hook=lambda d: SimpleNamespace(**d))
	auth_service.add_user(user_dto)

	return jsonify({'status': 'ok'})


@auth_rest_controller.route('/edit', methods=['POST'])
def edit_user():
	user_dto = json.loads(request.data, object_hook=lambda d: SimpleNamespace(**d))
	auth_service.edit_user(user_dto)

	return jsonify({'status': 'ok'})


@auth_rest_controller.route('/remove', methods=['POST'])
def remove_user():
	user_dto = json.loads(request.data, object_hook=lambda d: SimpleNamespace(**d))
	auth_service.remove_user(user_dto)

	return jsonify({'status': 'ok'})


@auth_rest_controller.route('/login', methods=['POST'])
def login():
	user_dto = json.loads(request.data, object_hook=lambda d: SimpleNamespace(**d))
	tokens = auth_service.login(user_dto)

	return jsonify(tokens)


@auth_rest_controller.route('/')
def validate():
	token = request.headers.get('Authentication')
	auth_service.validate(token)

	return jsonify({'status': 'ok'})
