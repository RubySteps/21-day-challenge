require 'test_helper'

class TaskListTest < MiniTest::Test

  def setup
    File.open('/tmp/todo.txt', 'w') do |file|
      file.puts "x #{Date.today - 1} #{Date.today} Completed task that took 1 day."
      file.puts "#{Date.today} Some other task with a +project"
      file.puts "(A) #{Date.today} New, super high priority task"
      file.puts "(C) #{Date.today} Prioritized, @context based task"
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

  def test_automatic_sorting
    assert_match(/^\(A\) #{Date.today} New, super high priority task/, @task_list.to_s)
  end

  def test_listing_contexts
    assert_equal(['@context'], @task_list.contexts)
  end

  def test_adding_tasks_to_list
    @task_list.add("Another task to do")
    assert_match(/#{Date.today} Another task to do/, @task_list.to_s)
  end

  def test_two_contexts
    @task_list.add("Another task to do @work")
    assert_equal(['@context', '@work'], @task_list.contexts)
  end
end
