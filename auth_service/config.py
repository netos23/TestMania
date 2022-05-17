import os

basedir = os.path.abspath(os.path.dirname(__file__))

SQLALCHEMY_TRACK_MODIFICATIONS = True
SQLALCHEMY_DATABASE_URI = 'sqlite:///' + os.path.join(basedir, 'app.db')
SQLALCHEMY_MIGRATE_REPO = os.path.join(basedir, 'migrations')
is_sqlite = SQLALCHEMY_DATABASE_URI.startswith('sqlite:')
ACCESS_TOKEN_LIFE_LENGTH = 30 * 3600 * 24
REFRESH_TOKEN_LIFE_LENGTH = 365 * 3600 * 24
ACCESS_TOKEN_SECRET = 'I_hate_Flask_app_butL0v3_Flutter'
REFRESH_TOKEN_SECRET = 'No1_w@nts_2bee_h@t3d_BUT-myDREMs'
SECRET_KEY = ACCESS_TOKEN_SECRET
