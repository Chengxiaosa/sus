import datetime

def get_today():
    now = datetime.datetime.now()

    year = now.year
    month = now.month
    day = now.day

    return datetime.datetime(year, month, day, 0, 0, 0)

def get_yesterday():

    now = datetime.datetime.now()
    yesterday = datetime.datetime.fromtimestamp(now.timestamp()-86400)

    year = yesterday.year
    month = yesterday.month
    day = yesterday.day

    return datetime.datetime(year, month, day, 0, 0, 0)
    
def get_nday_before(n):

    now = datetime.datetime.now()
    yesterday = datetime.datetime.fromtimestamp(now.timestamp()-n*86400)

    year = yesterday.year
    month = yesterday.month
    day = yesterday.day

    return datetime.datetime(year, month, day, 0, 0, 0)
    
