import unittest

from roman_numerals.converter import convert_to_decimal


class RomanNumeralsTest(unittest.TestCase):
    @staticmethod
    def test_single_letter_numerals():
        single_letter_numeral_map = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}
        for numeral, decimal in single_letter_numeral_map.items():
            assert convert_to_decimal(numeral) == decimal

    @staticmethod
    def test_double_letter_when_first_letter_greater_than_the_rest():
        assert convert_to_decimal("VI") == 6

    @staticmethod
    def test_double_letter_when_first_letter_lesser_than_the_rest():
        assert convert_to_decimal("IV") == 4

    @staticmethod
    def test_double_letter_when_first_equal_to_second():
        assert convert_to_decimal("II") == 2

    @staticmethod
    def test_triple_letter_when_all_three_letters_are_equal():
        assert convert_to_decimal("III") == 3

    @staticmethod
    def test_triple_letter_when_first_two_letters_greater():
        assert convert_to_decimal("MVI") == 1006

    @staticmethod
    def test_four_letters():
        value = convert_to_decimal("MCMXCIV")
        assert value == 1994

    @staticmethod
    def test_five_letters():
        value = convert_to_decimal("XXXIX")
        assert value == 39


if __name__ == '__main__':
    unittest.main()
