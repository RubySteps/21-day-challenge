require 'test_helper'

class TaskListTest < MiniTest::Test

  def setup
    File.open('/tmp/todo.txt', 'w') do |file|
      file.puts "x #{Date.today - 1} #{Date.today} Completed task that took 1 day."
      file.puts "#{Date.today} (A) New, super high priority task"
      file.puts "#{Date.today} Some other task with a +project"
      file.puts "#{Date.today} (C) Prioritized, @context based task"
    end
    @task_list = Todo::TaskList.new(File.open('/tmp/todo.txt'))
  end

  def teardown
    FileUtils.rm('/tmp/todo.txt') if File.exists?('/tmp/todo.txt')
  end

  def test_simple_list
    assert_equal('/tmp/todo.txt', @task_list.file)
  end

  def test_printing_list
    assert_match(/Some other task/, @task_list.to_s)
    refute_match(/Completed task/, @task_list.to_s)
  end
end
