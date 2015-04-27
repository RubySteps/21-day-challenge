require 'test_helper'

class TaskTest < MiniTest::Test

  def test_simple_add
    task = Todo::Task.new('Clean desk.')
    assert_equal("#{Date.today} Clean desk.", task.to_s)
  end
end
