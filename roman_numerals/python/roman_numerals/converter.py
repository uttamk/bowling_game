_single_letter_numeral_map = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}
_subtractive_numerals = [1, 10, 100]


def convert_to_decimal(roman):
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
        return _decimal_value(roman[2:], new_total_decimal)


def _decimal_value_1(roman):
    try:
        return _single_letter_numeral_map[roman]
    except KeyError:
        raise ValueError("Invalid Roman Numeral: should be one of {0}".format(_single_letter_numeral_map))


def _decimal_value_2(first, second):
    first_decimal = _decimal_value_1(first)
    second_decimal = _decimal_value_1(second)
    if first_decimal >= second_decimal:
        return first_decimal + second_decimal
    elif _is_valid_subtraction(first_decimal, second_decimal):
        return second_decimal - first_decimal
    else:
        raise ValueError(
            "Invalid Roman Numeral: only I, X and C are allowed as subtractive numerals"
            " and the following numeral must not be more than 100 times the first")


def _is_valid_subtraction(first_decimal, second_decimal):
    valid_first_numeral = first_decimal in _subtractive_numerals
    second_at_most_10_times_first = second_decimal / first_decimal <= 10

    return valid_first_numeral and second_at_most_10_times_first
