from dotenv import load_dotenv
import os

load_dotenv()

class Config:
    def __init__(self):
        self.WORKSPACE_ID = os.getenv('WORKSPACE_ID')
        self.USER_ID = os.getenv('USER_ID')
        self.API_KEY = os.getenv('API_KEY')
        self.POSITION = os.getenv('POSITION')
        self.BASE_URL = os.getenv('BASE_URL')
        self.TIMEZONE = os.getenv('TIMEZONE')