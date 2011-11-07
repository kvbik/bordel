
import itertools


def grouper(iterable, n, fillvalue=None):
    '''
    recipe taken from
    http://stackoverflow.com/questions/434287/what-is-the-most-pythonic-way-to-iterate-over-a-list-in-chunks

    >>> tuple(grouper('ABCDEFG', 3, 'x'))
    (('A', 'B', 'C'), ('D', 'E', 'F'), ('G', 'x', 'x'))
    '''
    args = [iter(iterable)] * n
    return itertools.izip_longest(*args, fillvalue=fillvalue)


if __name__ == '__main__':
    import unittest
    import doctest

    suite = unittest.TestSuite()
    suite.addTest(doctest.DocTestSuite())

    runner = unittest.TextTestRunner()
    runner.run(suite)

