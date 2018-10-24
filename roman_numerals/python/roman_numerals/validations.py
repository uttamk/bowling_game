import re


def validate(roman):
    if _same_numeral_repeated_more_than_thrice_consecutively(roman):
        raise ValueError("Invalid Roman Numeral: Each numeral can't be repeated consecutively more than thrice")
    if _numeral_divisible_by_5_repeated_more_than_once_consecutively(roman):
        raise ValueError("Invalid Roman Numeral: V L and D can't be consecutively repeated")


def _same_numeral_repeated_more_than_thrice_consecutively(roman):
    return re.search(r'([A-Z])\1{3,}', roman)


def _numeral_divisible_by_5_repeated_more_than_once_consecutively(roman):
    return re.search(r'([VLD])\1+', roman)
