from datetime import datetime, timedelta

import requests
import pytz

TIMEZONE = 'UTC'

class ClockifyAPIClient:
    def __init__(self, api_key: str, base_url: str, workspace_id: str, user_id: str):
        self.api_key = api_key
        self.base_url = base_url
        self.workspace_id = workspace_id
        self.user_id = user_id
        self.headers = {
            "X-Api-Key": self.api_key,
        }

    def get_workspaces(self):
        response = requests.get(f"{self.base_url}/workspaces", headers=self.headers)
        
        if response.status_code != 200:
            raise Exception(f"Failed to fetch data: {response.status_code}")
        
        return response.json()

    def get_user_info(self):
        response = requests.get(f"{self.base_url}/user", headers=self.headers)

        if response.status_code != 200:
            raise Exception(f"Failed to fetch data: {response.status_code}")

        return response.json()
    
    def _get_week_dates(self, week: str = 'current') -> tuple[str, str]:
        tz = pytz.timezone(TIMEZONE)
        now = datetime.now(tz)
        if week == 'previous':
            start_of_week = (now - timedelta(days=now.weekday() + 7)).replace(hour=0, minute=0, second=0, microsecond=0)
        else:
            start_of_week = (now - timedelta(days=now.weekday())).replace(hour=0, minute=0, second=0, microsecond=0)
        end_of_week = start_of_week + timedelta(days=6, hours=23, minutes=59, seconds=59)
        return start_of_week.isoformat(), end_of_week.isoformat()

    def _fetch_time_entries(self, week = 'current') -> list:
        start, end = self._get_week_dates(week)
        url = f'{self.base_url}/workspaces/{self.workspace_id}/user/{self.user_id}/time-entries'
        params = {'start': start, 'end': end}

        response = requests.get(url, headers=self.headers, params=params)
        response.raise_for_status()  
        return response.json()

    def get_time_entries(self, week_choice = 'current'):
        try:
            return self._fetch_time_entries(week_choice)
        except requests.exceptions.RequestException as e:
            print(f'Failed to retrieve time entries: {e}')