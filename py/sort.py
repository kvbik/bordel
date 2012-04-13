
class Host(object):
    def __init__(self, name):
        self.name = name

web2_aaa = Host('web2.aaa.com')
web1_bbb = Host('web1.bbb.com')
web1_aaa = Host('web1.aaa.com')

hosts = [
    web2_aaa,
    web1_bbb,
    web1_aaa,
]

hosts_sorted = [
    web1_aaa,
    web2_aaa,
    web1_bbb,
]


def get_host(h):
    parts = h.name.split('.')
    return parts[1:] + [parts[0]]

print(sorted(hosts, key=get_host) == hosts_sorted)

