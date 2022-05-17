from flask import jsonify

from app import app
from app.exception import IllegalRequestFormat
from dto import ErrorResponse


@app.errorhandler(IllegalRequestFormat)
def handle_bad_request(e):
	return jsonify(ErrorResponse.build_bad_request()), 400
