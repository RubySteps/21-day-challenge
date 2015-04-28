require 'test_helper'

class TaskTest < MiniTest::Test

  def test_simple_add
    task = Todo::Task.new('Clean desk.')
    assert_equal(Date.today, task.added)
    assert_equal("#{Date.today} Clean desk.", task.to_s)
    refute(task.done)
    assert_nil(task.completed)
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

  def test_starting_with_x_marks_as_done
    task = Todo::Task.new('x Clean desk.')
    assert(task.done)
  end

  def test_being_done_still_has_priority
    task = Todo::Task.new('x (A) Clean desk.')
    assert(task.done)
    assert_equal('A', task.priority)
    assert_equal("x (A) #{Date.today} Clean desk.", task.to_s)
  end

  def test_having_a_added_date
    yesterday = Date.today - 1
    task = Todo::Task.new("#{yesterday} Clean desk.")
    assert_equal(yesterday, task.added)
    assert_equal("#{yesterday} Clean desk.", task.to_s)
  end

  def test_adding_with_completed_date
    yesterday = Date.today - 1
    task = Todo::Task.new("x #{yesterday} #{Date.today} Clean desk.")
    assert(task.done)
    assert_equal(yesterday, task.added)
    assert_equal(Date.today, task.completed)
    assert_equal("x #{yesterday} #{Date.today} Clean desk.", task.to_s)
  end

  def test_marking_done_adds_completed_date
    task = Todo::Task.new("Clean desk.")
    refute(task.done)
    refute(task.completed)
    assert_equal(Date.today, task.added)
    task.complete
    assert(task.done)
    assert(task.completed)
    assert_equal("x #{Date.today} #{Date.today} Clean desk.", task.to_s)
  end

  def test_having_context
    task = Todo::Task.new("Clean desk @work.")
    assert_equal(["@work"], task.contexts)
  end

  def test_having_a_project
    task = Todo::Task.new("Clean desk +GTD.")
    assert_equal(["+GTD"], task.projects)
  end
end
