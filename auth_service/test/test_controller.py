def test_add_success(client, app):
	credentials = {
		'username': 'test_user',
		'password': 'test_user_password'
	}

	response = client.post('/add', json=credentials)
	assert response.status_code == 200 and response.json['status'] == 'ok'

	delete_response = client.post('/delete', json=credentials)
	assert delete_response.status_code == 200 and delete_response.json['status'] == 'ok'


def test_add_bad_request(client):
	response = client.post('/add', json={
		'username': 'test_user',
	})

	assert response.status_code == 400


def test_add_method_not_allowed(client):
	response = client.get('/add', json={
		'username': 'test_user',
		'password': 'test_user_password'
	})

	assert response.status_code == 405


def test_auth_success(client):
	credentials = {
		'username': 'test_user',
		'password': 'test_user_password'
	}

	register_response = client.post('/add', json=credentials)
	assert register_response.status_code == 200 and register_response.json['status'] == 'ok'

	login_response = client.post('/login', json=credentials)
	assert login_response.status_code == 200

	headers = {'Authentication': f'Bearer {login_response.json["access_token"]}'}
	validate_response = client.get('/validate', headers=headers)
	assert validate_response.status_code == 200 and validate_response.json['status'] == 'ok'

	delete_response = client.post('/delete', json=credentials)
	assert delete_response.status_code == 200 and delete_response.json['status'] == 'ok'
