import unittest
from game import Game

class TestBowlingGame(unittest.TestCase):
    def setUp(self):
        self.game = Game()

    def roll_many(self, pins, no_of_turns):
        for i in range(0, no_of_turns):
            self.game.roll(pins)

    def roll_spare(self):
        self.game.roll(5)
        self.game.roll(5)

    def roll_strike(self):
        self.game.roll(10)


    def test_gutter_game(self):
      self.roll_many(0, 20)

      assert self.game.score == 0

    def test_all_ones(self):
        self.roll_many(1, 20)

        assert self.game.score == 20

    def test_one_spare(self):
        self.roll_spare()
        self.game.roll(3)
        self.roll_many(0, 17)

        assert self.game.score == 16

    def test_one_strike(self):
        self.roll_strike()
        self.game.roll(3)
        self.game.roll(4)
        self.roll_many(16, 0)

        assert self.game.score == 24

    def test_perfect_game(self):
        self.roll_many(10, 20)

        assert self.game.score == 300
