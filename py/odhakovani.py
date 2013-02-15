import sys
import unicodedata

for line in sys.stdin:
    if hasattr(line, 'decode'):
        line = line.decode('utf8')
    slugified = unicodedata.normalize('NFKD', line).encode('ascii', 'ignore').decode('ascii')
    sys.stdout.write(slugified)
