#!/usr/local/bin/python3

import math

vals = [2, 4, 8, 16, 64, 512]
fns  = [
    [lambda x: x, 'n'],
    [lambda x: x * math.log2(x), 'n\log_2(n)'],
    [lambda x: x ** 2, 'n^2'],
    [lambda x: x ** 3, 'n^3'],
    [lambda x: 2 ** x, '2^n'],
    [lambda x: math.factorial(x), 'x!']
]

for f in fns:
    print('\\hline')
    print('${}$'.format(f[1]), end='')
    for v in vals:
        n = f[0](v)
        if n < 100000:
            print(' & {}'.format(math.floor(n)), end='')
        else:
            log10n = math.floor(math.log10(n))
            strn = str(n)
            print(' & ${}.{} \\times 10^{{{}}}$'.format(strn[0], strn[1:4], log10n), end='')
    print(' \\\\')
