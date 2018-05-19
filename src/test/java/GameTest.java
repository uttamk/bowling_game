import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class GameTest {
    private Game game;

    @Before
    public void setUp() {
        game = new Game();
    }

    @Test
    public void testGutterGame() {

        rollMany(20, 0);

        assertEquals(0, game.score());
    }

    @Test
    public void testAllOnes() {
        rollMany(20, 1);

        assertEquals(20, game.score());
    }

    @Test
    public void testOneSpare() {
        rollSpare();
        rollMany(1, 3);
        rollMany(17, 0);

        assertEquals(16, game.score());
    }

    @Test
    public void testOneStrike() {
        rollStrike();
        rollMany(1, 3);
        rollMany(1, 4);
        rollMany(16, 0);

        assertEquals(24, game.score());

    }

    private void rollStrike() {
        rollMany(1, 10);
    }

    private void rollSpare() {
        game.roll(5);
        game.roll(5);
    }

    private void rollMany(int times, int pins) {
        for (int i = 0; i < times; i++) {
            game.roll(pins);
        }
    }
}
