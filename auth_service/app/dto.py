import time

STATUS_OK = 'ok'


class ErrorResponse:
	@staticmethod
	def build_not_found():
		timestamp = time.time()
		return ErrorResponse(404, 'Not found', timestamp)

	@staticmethod
	def build_bad_request():
		timestamp = time.time()
		return ErrorResponse(400, 'Bad request', timestamp)

	@staticmethod
	def build_access_denied():
		timestamp = time.time()
		return ErrorResponse(403, 'Access denied', timestamp)

	def __init__(self, code, message, timestamp):
		self.timestamp = timestamp
		self.message = message
		self.code = code


class SuccessResponse:
	@staticmethod
	def build_ok():
		return SuccessResponse(STATUS_OK)

	def __init__(self, status):
		self.status = status


class TokensResponse:
	def __init__(self, access, refresh):
		self.refresh = refresh
		self.auth = access
