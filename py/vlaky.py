
# Rozdíl odjezdů musí být násobkem NSD

# Problém byl v tom, aby ti nezadali jednu periodu jedno prvočíslo, druhou periodu druhé prvočíslo, rozdíl třetí prvočíslo, oni se potkají za sto let, a ty to budeš počítat
# brutální metodou tejden.

def f(a, b, d):
    """
    vlak ``a`` vyjede v 0, vlak ``b`` vyjede o ``d`` pozdeji,
    vysledek je kolikrat projede vlak ``a`` nez se potka s ``b``

    vratim -1 pokud se vlaky nikdy nepotkaji

    v podstate hledame nasledujici rovnost, napr: (x*60 - 10) % 45 == 0

    >>> f(12, 45, 0) * 12
    180
    >>> f(12, 45, 15) * 12
    60
    >>> f(12, 45, 10)
    -1
    >>> f(60, 12, 5)
    -1
    """
    i = 1
    mod = -1

    if d and int(b/d) != b/d:
        # kdyz neni ``b`` delitelne celociselne ``d``, zadny nasobek ``a`` ho nedozene
        # TODO: to je ovsem tezka hypoteza a chtela by matematicky overit
        return mod

    while mod != 0:
        mod = (i*a - d) % b
        i += 1
    return i-1

