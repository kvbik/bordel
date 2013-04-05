import pytz
from datetime import datetime

# okolo San Francisco.gpx
sf = pytz.timezone('US/Pacific')
s = '2011-09-11T22:09:59Z'
d = datetime.strptime(s, '%Y-%m-%dT%H:%M:%SZ').replace(tzinfo=pytz.utc)
print(sf.normalize(d))

# navsteva v Talmberku.gpx
p = pytz.timezone('Europe/Prague')
s = '2011-09-25T10:29:31Z'
d = datetime.strptime(s, '%Y-%m-%dT%H:%M:%SZ').replace(tzinfo=pytz.utc)
print(p.normalize(d))

