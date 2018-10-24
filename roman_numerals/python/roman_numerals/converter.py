from roman_numerals import single_numeral_map
from roman_numerals.validations import validate_numeral, validate_subtraction


def convert_to_decimal(roman):
    validate_numeral(roman)
    reversed_roman = roman[::-1]
    return _decimal_value(reversed_roman, 0)


def _decimal_value(roman, total_decimal):
    roman_numeral_length = len(roman)
    if roman_numeral_length == 0:
        return total_decimal
    elif roman_numeral_length == 1:
        return total_decimal + _decimal_value_1(roman[0])
    else:
        new_total_decimal = total_decimal + _decimal_value_2(roman[1], roman[0])
        rest_of_roman = roman[2:]
        return _decimal_value(rest_of_roman, new_total_decimal)


def _decimal_value_1(single_numeral):
    return single_numeral_map[single_numeral]


def _decimal_value_2(first_single_numeral, second_single_numeral):
    first_decimal = _decimal_value_1(first_single_numeral)
    second_decimal = _decimal_value_1(second_single_numeral)
    if first_decimal >= second_decimal:
        return first_decimal + second_decimal
    else:
        validate_subtraction(first_decimal, second_decimal)
        return second_decimal - first_decimal
