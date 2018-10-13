from functools import reduce

_single_letter_numeral_map = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}


def convert_to_decimal(roman):
    return reduce(
        lambda total, letter: total + _single_letter_numeral_map[letter] - 2 * (
                    total % _single_letter_numeral_map[letter]), roman, 0)
