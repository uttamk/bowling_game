class Game(object):
    def __init__(self):
        self._rolls = []
        for i in range(0,21): self._rolls.append(0)
        self._current_roll = 0

    def roll(self, pins):
        self._rolls[self._current_roll] = pins
        self._current_roll +=1

    @property
    def score(self):
        _score = 0
        frame_index =0
        for frame in range(0, 10):
            if self._is_strike(frame_index):
                _score += 10 + self._rolls[frame_index+1] + self._rolls[frame_index+2]
                frame_index += 1
            elif self._is_spare(frame_index):
                _score += 10 + self._rolls[frame_index+2]
                frame_index += 2
            else:
                _score += self._rolls[frame_index] + self._rolls[frame_index+1]
                frame_index += 2
        return _score

    def _is_spare(self, frame_index):
        return self._rolls[frame_index] + self._rolls[frame_index+1] == 10
    def _is_strike(self, frame_index):
        return self._rolls[frame_index] == 10
