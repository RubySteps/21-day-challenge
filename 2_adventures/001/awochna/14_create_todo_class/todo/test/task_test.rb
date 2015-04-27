require 'test_helper'

class TaskTest < MiniTest::Test

  def test_simple_add
    task = Todo::Task.new('Clean desk.')
    assert_equal(Date.today, task.added)
    assert_equal("#{Date.today} Clean desk.", task.to_s)
  end

  def test_add_with_priority
    task = Todo::Task.new('(A) Clean desk.')
    assert_equal('A', task.priority)
    assert_equal("(A) #{Date.today} Clean desk.", task.to_s)
  end

  def test_parenthesis_in_string
    task = Todo::Task.new('Clean desk (sometime this week).')
    assert_equal(nil, task.priority)
    assert_equal("#{Date.today} Clean desk (sometime this week).", task.to_s)
  end

  def test_priority_only_appears_at_beginning_of_task
    task = Todo::Task.new('Clean desk (A).')
    assert_equal(nil, task.priority)
    assert_equal("#{Date.today} Clean desk (A).", task.to_s)
  end

  def test_priority_only_appears_at_beginning_of_task_2
    task = Todo::Task.new('Clean (A) desk.')
    assert_equal(nil, task.priority)
    assert_equal("#{Date.today} Clean (A) desk.", task.to_s)
  end
end
