Feature: Turmites don't eat wood

  Scenario: turmites exist on a 2D grid of squares
    Given a turmite is spawned
    Then it should be at location 0, 0


  Scenario Outline: turmites eating squares
    Given a turmite is spawned
    And my current state is <state>
    When I move to a <color> square
    Then I should move 90° <direction>
    And the square should change to <write_color>
    And my state should change to <next_state>

  Examples:
    | state | color | direction | write_color | next_state |
    |    0  |   0   |   right   |      1      |     0      |
    |    0  |   1   |   right   |      1      |     1      |
