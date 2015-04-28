Feature: Turmites don't eat wood

  Scenario: turmites exist on a 2D grid of squares
    Given a turmite is spawned
    Then it should be at location 0, 0
    And it should be heading North

  @wip
  Scenario Outline: turmites eating squares
    Given a turmite is spawned
    And my current state is <state>
    When I move to a <color> square
    Then I should move 90° <direction> and be facing <heading>
    And the square should change to <write_color>
    And my state should change to <next_state>

  Examples:
    | x | y | state | color | direction | heading | write_color | next_state |
    | 0 | 1 | 0     | 0     | right     | east    | 1           | 0          |
    |   |   | 0     | 1     | right     | south   | 1           | 1          |
