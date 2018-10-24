from roman_numerals import single_numeral_to_decimal_map
from roman_numerals.types import RomanNumeral, SingleRomanNumeral, Decimal
from roman_numerals.validations import validate_numeral, validate_subtraction


def convert_to_decimal(roman_numeral: RomanNumeral) -> Decimal:
    validate_numeral(roman_numeral)
    reversed_roman = roman_numeral[::-1]
    return _decimal_value(reversed_roman, 0)


def _decimal_value(numeral: RomanNumeral, total: Decimal) -> Decimal:
    numeral_length = len(numeral)
    if numeral_length == 0:
        return total
    elif numeral_length == 1:
        return total + _decimal_value_1(numeral[0])
    else:
        new_total = total + _decimal_value_2(numeral[1], numeral[0])
        rest_of_numeral = numeral[2:]
        return _decimal_value(rest_of_numeral, new_total)


def _decimal_value_1(single_numeral: SingleRomanNumeral) -> Decimal:
    return single_numeral_to_decimal_map[single_numeral]


def _decimal_value_2(first_single_numeral: SingleRomanNumeral, second_single_numeral: SingleRomanNumeral) -> Decimal:
    first_decimal = _decimal_value_1(first_single_numeral)
    second_decimal = _decimal_value_1(second_single_numeral)
    if first_decimal >= second_decimal:
        return first_decimal + second_decimal
    else:
        validate_subtraction(first_decimal, second_decimal)
        return second_decimal - first_decimal
