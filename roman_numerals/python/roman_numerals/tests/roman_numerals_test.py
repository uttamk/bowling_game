import unittest

import pytest

from roman_numerals.converter import convert_to_decimal


def test_single_letter_numerals():
    single_letter_numeral_map = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}
    for numeral, decimal in single_letter_numeral_map.items():
        assert convert_to_decimal(numeral) == decimal


def test_double_letter_when_first_letter_greater_than_the_rest():
    assert convert_to_decimal("VI") == 6


def test_double_letter_when_first_letter_lesser_than_the_rest():
    assert convert_to_decimal("IV") == 4


def test_double_letter_when_first_equal_to_second():
    assert convert_to_decimal("II") == 2


def test_triple_letter_when_all_three_letters_are_equal():
    assert convert_to_decimal("III") == 3


def test_triple_letter_when_first_two_letters_greater():
    assert convert_to_decimal("MVI") == 1006


def test_five_letters():
    value = convert_to_decimal("XXXIX")
    assert value == 39


def test_raise_exception_on_invalid_input():
    with pytest.raises(ValueError):
        convert_to_decimal("LM")
    with pytest.raises(ValueError):
        convert_to_decimal("MCLD")
    with pytest.raises(ValueError):
        convert_to_decimal("XYZ")
    with pytest.raises(ValueError):
        convert_to_decimal("MIL")
    with pytest.raises(ValueError):
        convert_to_decimal("MDDIV")


if __name__ == '__main__':
    unittest.main()
