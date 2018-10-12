_single_letter_numeral_map = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}


def convert_to_decimal(roman):
    return _decimal_value(roman, 0)


def _decimal_value(roman, decimal):
    if len(roman) == 0:
        return decimal
    elif len(roman) == 1:
        return decimal + _decimal_value_1(roman[0])
    elif len(roman) == 3:
        return decimal + _decimal_value_1(roman[0]) + _decimal_value_2(roman[1], roman[2])
    else:
        return _decimal_value(roman[2:], decimal + _decimal_value_2(roman[0], roman[1]))


def _decimal_value_1(roman):
    return _single_letter_numeral_map[roman]


def _decimal_value_2(first, second):
    first_decimal = _decimal_value_1(first)
    second_decimal = _decimal_value_1(second)
    if first_decimal >= second_decimal:
        return first_decimal + second_decimal
    else:
        return second_decimal - first_decimal
