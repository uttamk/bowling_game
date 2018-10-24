import re

from roman_numerals import single_numeral_map

_subtractive_decimals = [1, 10, 100]


def validate_numeral(roman):
    if _has_invalid_numerals(roman):
        raise ValueError("Invalid Roman Numeral: should be one of {0}".format(single_numeral_map))
    if _same_numeral_repeated_more_than_thrice_consecutively(roman):
        raise ValueError("Invalid Roman Numeral: Each numeral can't be repeated consecutively more than thrice")
    if _numeral_divisible_by_5_repeated_more_than_once_consecutively(roman):
        raise ValueError("Invalid Roman Numeral: V L and D can't be consecutively repeated")


def validate_subtraction(first_decimal, second_decimal):
    invalid_first_numeral = first_decimal not in _subtractive_decimals
    second_more_than_10_times_first = second_decimal / first_decimal > 10

    if invalid_first_numeral or second_more_than_10_times_first:
        raise ValueError(
            "Invalid Roman Numeral: only I, X and C are allowed as subtractive numerals"
            " and the following numeral must not be more than 100 times the first")


def _has_invalid_numerals(roman):
    return [numeral for numeral in roman if numeral not in single_numeral_map.keys()]


def _same_numeral_repeated_more_than_thrice_consecutively(roman):
    return re.search(r'([A-Z])\1{3,}', roman)


def _numeral_divisible_by_5_repeated_more_than_once_consecutively(roman):
    return re.search(r'([VLD])\1+', roman)
