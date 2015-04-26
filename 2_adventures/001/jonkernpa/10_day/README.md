# Adventure Day 10

Inspired by @jbrains doing (Langton's Ants)[https://en.wikipedia.org/wiki/Langton%27s_ant], I think I'll ponder the similar
(turmites)[https://en.wikipedia.org/wiki/Turmite]

Why not!?

Repeating from wikipedia:

## Specification

The following specification is specific to turmites on a two-dimensional square grid, the most studied type of turmite. Turmites on other grids can be specified in a similar fashion.

As with Langton's ant, turmites perform the following operations each timestep:

- turn on the spot (by some multiple of 90°)
- change the color of the square
- move forward one square.

As with Turing machines, the actions are specified by a state transition table listing the current internal state of the turmite and the color of the cell it is currently standing on.

    +------------------+-------------------------------------------------------------------+
    |                  |                          Current color                            |
    |                  |---------------------------------+---------------------------------+
    |                  |                 0               |                1                |
    |                  |-------------+------+------------+-------------+------+------------+
    |                  | Write color | Turn | Next state | Write color | Turn | Next state |
    +--------------+---+-------------+------+------------+-------------+------+------------+
    |              | 0 |      1      |  R   |      0     |      1      |   R  |      1     |
    |Current state +---+-------------+------+------------+-------------+------+------------+
    |              | 1 |      0      |  N   |      0     |      0      |   N  |      1     |
    +--------------+---+-------------+------+------------+-------------+------+------------+

The direction to turn is one of L (90° left), R (90° right), N (no turn) and U (180° U-turn).

# Implementation Notes

## Day 8

* Okay, so a turmite needs to know it's current state: 0 or 1

## Day 9

* The turmite needs to observe the color of the square it is on.

Note that I said "observe" and I did not imply that the color of the square is a property of the turmite.

## Day 10

* Might not get to do anything tonight...