module Todo
  class TaskList

    attr_reader :file
    attr_accessor :tasks

    def initialize(filename)
      @file = filename
      array_of_lines = IO.readlines(filename)
      @tasks = []
      counter = 1
      array_of_lines.each do |line|
        @tasks << Task.new(line, counter)
        counter += 1
      end
    end

    def to_s
      list = []
      @tasks.each do |task|
        list << task.to_s unless task.done
      end
      list.sort.join
    end

    def length
      @tasks.length
    end

    def completed_length
      @tasks.select { |task| task.done }.length
    end

    def incomplete_length
      @tasks.select { |task| !task.done }.length
    end

    def contexts
      list = []
      @tasks.each do |task|
        list << task.contexts unless task.contexts == []
      end
      list.flatten.uniq.sort
    end

    def projects
      list = []
      @tasks.each do |task|
        list << task.projects unless task.projects == []
      end
      list.flatten.uniq.sort
    end

    def add(task)
      @tasks << task
      save
    end

    def complete(task_number)
      @tasks[task_number.to_i - 1].complete
      save
    end

    private

    def save
      tasks_without_ids = @tasks.map { |task| task.id = nil; task }
      File.open(@file, 'w') do |file|
        file.puts tasks_without_ids
      end
    end
  end
end
