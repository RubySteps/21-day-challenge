# Adventure Day 21

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

As with Turing machines, the actions are specified by a state transition table listing the current internal
state of the turmite and the color of the cell it is currently standing on.

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

## Day 11

* Let's execute a turn. I am not certain I grok the state table, but I think it says this:


    Scenario Outline: turmites eating squares
      Given my current state is <state>
      When I land on a <color> square
      Then I should move 90° <direction>
      And the square should change to <write_color>
      And my state should change to <next_state>

      Examples:
        | state | color | direction | write_color | next_state |
        |    0  |   0   |   right   |      1      |     0      |
        |    0  |   1   |   right   |      1      |     1      |

## Day 12

* Nada

## Day 13

* Let's execute a turn. I am not certain I grok the state table, but I think it says this:

    Scenario Outline: turmites eating squares
      Given my current state is <state>
      When I land on a <color> square
      Then I should move 90° <direction>
      And the square should change to <write_color>
      And my state should change to <next_state>

      Examples:
        | state | color | direction | write_color | next_state |
        |    0  |   0   |   right   |      1      |     0      |
        |    0  |   1   |   right   |      1      |     1      |

## Day 14

* Still doing the turn...

## Day 15

* CYA day

I like code coverage... So I installed my fave [SimpleCov](https://github.com/colszowka/simplecov) tool,
and did the needful to the `spec_helper.rb` file.

## Day 16

* So, when the turmite moves to a new square,
    * it translates,
    * it potentially faces a new direction
    * it can change it's own state
    * it can change the color of the square it is on (like leaving a turd behind?)

## Day 17

* Got tired of copying the folders from day to day...
* Now I created a long-running project: https://github.com/JonKernPA/turmites

## Day 18

*  Day 18: got further in the test matrix for turmite moving, turning, changing state, and changing color.
* See [commit](https://github.com/JonKernPA/turmites/commit/8226462cb3e2fcc7184db7282b22d1a69804a9c1)

## Day 19

* It's 11pm, just got back from a dance recital in Philly at Swarthmore... it's time to look at the Eagles' draft picks now

## Day 20

* It's 7am, hedging my bets as we are heading to a beer fest today. Gonna get my commit in early!

## Day 21

* Let's see if I can do any meaningful turmite work for this commit.