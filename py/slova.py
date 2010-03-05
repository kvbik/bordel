#!/usr/bin/env python
# -*- coding: utf-8 -*-


import re

def words(input):
    '''
    >>> words('a b c')
    ['a', 'b', 'c']
    >>> words('')
    []
    >>> words('aaa bbb\\nccc')
    ['aaa', 'bbb', 'ccc']
    >>> words('to-day')
    ['to-day']
    >>> u = unicode('Příliš žluťoučký kůň úpěl ďábelské ódy', 'utf-8')
    >>> s = u.split()
    >>> words(u) == s
    True
    '''
    finder = re.compile(r'\b[-\w]+\b', re.DOTALL | re.UNICODE)
    found = finder.findall(input)
    return found

def pocet(vstup):
    '''
    >>> pocet('a b c')
    nalezeno 3 slov
    >>> pocet('')
    nalezeno 0 slov
    >>> pocet('aaa bbb\\nccc')
    nalezeno 3 slov
    >>> pocet('to-day')
    nalezeno 1 slov
    >>> u = unicode('Příliš žluťoučký kůň úpěl ďábelské ódy', 'utf-8')
    >>> pocet(u)
    nalezeno 6 slov
    '''
    print 'nalezeno %s slov' % len(words(vstup))

if __name__ == '__main__':
    import unittest
    import doctest

    suite = unittest.TestSuite()
    suite.addTest(doctest.DocTestSuite())

    runner = unittest.TextTestRunner()
    runner.run(suite)

