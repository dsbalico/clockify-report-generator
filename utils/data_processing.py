from dateutil.parser import isoparse
from datetime import datetime
from pytz import timezone

def get_period_covered(time_entries):
    start_times = []
    end_times = []

    for entry in time_entries:
        start_times.append(isoparse(entry['timeInterval']['start']))
        end_times.append(isoparse(entry['timeInterval']['end']))

    # Determine the earliest start time and the latest end time
    period_start = min(start_times)
    period_end = max(end_times)

    # Format the dates as "Month Day, Year"
    formatted_start = period_start.strftime("%B %d, %Y")
    formatted_end = period_end.strftime("%B %d, %Y")

    # Output the period covered
    period_covered = f"{formatted_start} - {formatted_end}"

    return period_covered

def transform_data(time_entries):
    # Philippine Time (PHT) timezone
    pht = timezone('Asia/Manila')

    # Convert JSON data
    formatted_data = []

    for entry in time_entries:
        # Extract data
        start_time_utc = datetime.fromisoformat(entry['timeInterval']['start'].replace('Z', '+00:00'))
        end_time_utc = datetime.fromisoformat(entry['timeInterval']['end'].replace('Z', '+00:00'))
        
        # Convert to Philippine Time
        start_time_pht = start_time_utc.astimezone(pht)
        end_time_pht = end_time_utc.astimezone(pht)
        
        # Calculate duration in hours
        duration_str = entry['timeInterval']['duration']
        duration_hours = 0
        duration_minutes = 0
        duration_seconds = 0

        # Extract hours, minutes, and seconds from the duration string
        if 'H' in duration_str:
            duration_hours = int(duration_str.split('H')[0].replace('PT', ''))
            duration_str = duration_str.split('H')[1]
        if 'M' in duration_str:
            duration_minutes = int(duration_str.split('M')[0].replace('PT', ''))
            duration_str = duration_str.split('M')[1] if 'M' in duration_str else ''
        if 'S' in duration_str:
            duration_seconds = int(duration_str.replace('PT', '').replace('S', ''))

        # Convert everything to hours
        duration_total_hours = duration_hours + duration_minutes / 60 + duration_seconds / 3600
        
        # Format date to mm/dd/yyyy
        date_str = start_time_pht.strftime('%m/%d/%Y')
        
        # Format times to 24-hour format
        start_time_formatted = start_time_pht.strftime('%H:%M')
        end_time_formatted = end_time_pht.strftime('%H:%M')
        
        # Append to the result list
        formatted_data.append({
            'date': date_str,
            'description': entry['description'],
            'startTime': start_time_formatted,
            'endTime': end_time_formatted,
            'duration': duration_total_hours
        })
        
    formatted_data.reverse()

    return formatted_data

def get_week_number(date_obj):
    # Get the day of the month
    day = date_obj.day
    
    # Calculate the week number of the month
    week_number = (day - 1) // 7 + 1
    
    return week_number