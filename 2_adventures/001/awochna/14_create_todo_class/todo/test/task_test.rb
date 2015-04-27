require 'test_helper'

class TaskTest < MiniTest::Test

  def test_simple_add
    task = Todo::Task.new('Clean desk.')
    assert_equal("#{Date.today} Clean desk.", task.to_s)
  end

  def test_add_with_priority
    task = Todo::Task.new('(A) Clean desk.')
    assert_equal('A', task.priority)
    assert_equal("(A) #{Date.today} Clean desk.", task.to_s)
  end
end
