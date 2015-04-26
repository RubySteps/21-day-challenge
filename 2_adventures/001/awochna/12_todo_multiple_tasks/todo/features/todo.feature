Feature: User can add new tasks
  As a busy person who lives on the command line
  I want to keep a list of the things I need to do

  Scenario: Add a new task
    Given the file "/tmp/todo.txt" doesn't exist
    When I successfully run `todo -f /tmp/todo.txt add 'Some new task'`
    Then I successfully run `todo -f /tmp/todo.txt ls`
    And the stdout should contain "Some new task"

  Scenario: List multiple tasks
    Given the file "/tmp/todo.txt" doesn't exist
    When I successfully run `todo -f /tmp/todo.txt add 'My first task'`
    And I successfully run `todo -f /tmp/todo.txt add 'Another, second task'`
    Then I successfully run `todo -f /tmp/todo.txt ls`
    And the stdout should contain "My first task"
    And the stdout should contain "Another, second task"

  Scenario: Adding a new task gives it a date
    Given the file "/tmp/todo.txt" doesn't exist
    When I successfully run `todo -f /tmp/todo.txt add 'Some new task'`
    Then I successfully run `todo -f /tmp/todo.txt ls`
    And the output should match /\d{4}-\d{2}-\d{2}/
