module Todo
  # Creates a task list to hold all of our tasks.
  class TaskList < Array

    attr_reader :file

    # Initializes a TaskList object using a passed filename or array.
    #
    # @param filename [String, Array] the name of the file to load as a TaskList
    #
    # Example, if your todo.txt file is located at:
    #
    #   ~/.todo.txt
    #
    # You would create a TaskList as follows:
    #
    #   task_list = Todo::TaskList.new('~/.todo.txt')
    #
    # An example of this implementation can be found in ../../bin/todo
    #
    # You can also pass an array to create a TaskList. This is mostly used
    # internally in this file.
    def initialize(filename)
      if filename.instance_of? String
        @file = filename
        array_of_lines = IO.readlines(filename)
        
        # Turn each line of the todo.txt file into a task,
        # adding to self.
        array_of_lines.each do |line|
          self.push Task.new(line)
        end
      elsif filename.instance_of? Array
        filename.each do |el|
          self.push el if el.instance_of? Task
          self.push Task.new(el) if el.instance_of? String
        end
      end
    end

    # Nicely convert the TaskList into a String implicitly.
    #
    # @return [String] the todo.txt formated string.
    #
    # This is aimed printing to the file or viewing the entire list.
    #
    # Example:
    #
    #   task_list = Todo::TaskList.new('~/.todo.txt')
    #   puts task_list
    def to_str
      self.sort.join("\n")
    end

    # Create a new TaskList, a subset of incomplete tasks from the current
    # TaskList.
    #
    # @return [TaskList] a list of only incomplete tasks.
    #
    # Inverse of #completed.
    #
    # Example:
    # 
    #   task_list = Todo::TaskList.new('~/.todo.txt')
    #   puts task_list.incomplete
    def incomplete
      incomplete_array = self.reject { |task| task.done }
      TaskList.new(incomplete_array)
    end

    # Create a new TaskList that is a subset of the tasks in the current
    # TaskList only if the are completed.
    #
    # @return [TaskList] a list of only complete tasks.
    #
    # Inverse of #incomplete.
    #
    # Example:
    #
    #   task_list = Todo::TaskList.new('~/.todo.txt')
    #   puts task_list.completed
    def completed
      completed_array = self.select { |task| task.done }
      TaskList.new(completed_array)
    end

    # An array of all unique contexts for all Tasks in the TaskList.
    #
    # @return [Array] all of the unique contexts from tasks in this list.
    #
    # Gathers the contexts by asking each task for it's context array and
    # putting them all together.
    #
    # Similar implementation to #projects.
    #
    # Example:
    #
    #   task_list = Todo::TaskList.new('~/.todo.txt')
    #   puts task_list.contexts.join("\n")
    #
    # Can be combined with #incomplete or #completed.
    #
    # Example:
    #
    #   puts task_list.incomplete.contexts.join("\n")
    def contexts
      list = []
      self.each do |task|
        list << task.contexts unless task.contexts == []
      end
      list.flatten.uniq.sort
    end

    # An array of all unique projects for all Tasks in the TaskList.
    #
    # @return [Array] all of the unique projects from tasks in this list.
    #
    # Gathers the projects by asking each task for it's projects array and
    # putting them all together.
    #
    # Similar implementation to #contexts.
    #
    # Example:
    #
    #   task_list = Todo::TaskList.new('~/.todo.txt')
    #   puts task_list.projects.join("\n")
    #
    # Can be combined with #incomplete or #completed.
    #
    # Example:
    #
    #   puts task_list.incomplete.projects.join("\n")
    def projects
      list = []
      self.each do |task|
        list << task.projects unless task.projects == []
      end
      list.flatten.uniq.sort
    end

    # Adds a task to the TaskList.
    # 
    # @param task [Task] the task to be added to the TaskList.
    # @return [Boolean] if the task was saved to the file.
    #
    # The input should be a Task object. Automatically saves the TaskList if
    # adding was successful.
    #
    # Example:
    #
    #   task_list = TaskList.new([])
    #   task_list.add(Todo::Task.new("Some task")
    #   puts task_list.incomplete
    def add(task)
      if self.push task
        save
      else
        false
      end
    end

    # Marks a task as complete.
    #
    # @param task_id [String] the id for the task to be marked.
    # @return [Boolean] if the list was saved or not.
    #
    # Input should be the id string for the task. Automatically saves the
    # TaskList if marking was successful.
    #
    # Example:
    #
    #   task_list = TaskList.new(["Some task {id:some}"])
    #   task_list.complete('some')
    def complete(task_id)
      if self.id(task_id).complete
        save
      else
        false
      end
    end

    # Find a task by it's identifier.
    #
    # @param identifier [String] the task's identifier.
    # @return [Task] the first task found.
    #
    # Will return the first task found, not all of them. This is why having
    # unique identifiers is important.
    #
    # Example:
    #
    #   task_list = TaskList.new(["Some task {id:some}"])
    #   puts task_list.id('some')
    #   #=> 2015-04-29 Some task {id:some}
    def id(identifier)
      self.each do |task|
        if task.id == identifier
          return task
        end
      end
      false
    end

    private

    # Saves a TaskList to it's source file.
    #
    # This function is called by other functions in the TaskList.
    #
    # @see #complete
    # @see #add
    def save
      File.open(@file, 'w') do |file|
        file.puts self
      end
    end
  end  # class Todo::TaskList
end  # namespace Todo
