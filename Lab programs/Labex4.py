
from itertools import permutations

def solve_cryptarithmetic():
    letters = 'SENDMORY'

    for perm in permutations(range(10), len(letters)):
        d = dict(zip(letters, perm))

        # First letters cannot be zero
        if d['S'] == 0 or d['M'] == 0:
            continue

        SEND = (d['S'] * 1000 + d['E'] * 100 +
                d['N'] * 10 + d['D'])

        MORE = (d['M'] * 1000 + d['O'] * 100 +
                d['R'] * 10 + d['E'])

        MONEY = (d['M'] * 10000 + d['O'] * 1000 +
                 d['N'] * 100 + d['E'] * 10 + d['Y'])

        if SEND + MORE == MONEY:
            print("Solution found:")
            print("SEND =", SEND)
            print("MORE =", MORE)
            print("MONEY =", MONEY)
            print("\nLetter assignments:")
            for letter in sorted(d):
                print(letter, "=", d[letter])
            return

    print("No solution found.")

solve_cryptarithmetic()
