from flask import jsonify

from app import app
from app.dto import ErrorResponse
from app.exception import IllegalRequestFormatException, AccessDeniedException


@app.errorhandler(IllegalRequestFormatException)
def handle_bad_request(e):
	return jsonify(ErrorResponse.build_bad_request().__dict__), 400


@app.errorhandler(AccessDeniedException)
def handle_bad_request(e):
	return jsonify(ErrorResponse.build_access_denied().__dict__), 403
