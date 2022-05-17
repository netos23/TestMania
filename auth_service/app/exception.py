class IllegalRequestFormatException(Exception):

	def __init__(self, *args: object) -> None:
		super().__init__(*args)


class AccessDeniedException(Exception):
	def __init__(self, *args: object) -> None:
		super().__init__(*args)
