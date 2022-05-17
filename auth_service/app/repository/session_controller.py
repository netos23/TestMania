from app import Session


class SessionController:
	def __init__(self):
		self.has_session = False
		self.session = None

	def begin_session(self):
		self.has_session = True
		self.session = Session()

	def current_session(self):
		if not self.has_session:
			# todo: normal exception
			raise 'Session closed'
		return self.session

	def end_session(self):
		self.has_session = False
		self.session.commit()
		self.session.close()
