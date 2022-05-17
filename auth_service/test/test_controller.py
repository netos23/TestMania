def test_add_success(client):
	response = client.post('/add', json={
		'username': 'test_user',
		'password': 'test_user_password'
	})

	assert response.status_code == 200 and response.json['status'] == 'ok'


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
