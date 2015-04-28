module Todo
  class TaskList < Array

    attr_reader :file

    def initialize(filename)
      @file = filename
      array_of_lines = IO.readlines(filename)
      array_of_lines.each do |line|
        self.push Task.new(line)
      end
    end

    def to_s
      self.reject { |task| task.done }.sort.join("\n")
    end

    def dump
      self.sort.join("\n")
    end

    def completed_length
      completed.length
    end

    def incomplete_length
      incomplete.length
    end

    def contexts
      list = []
      self.each do |task|
        list << task.contexts unless task.contexts == []
      end
      list.flatten.uniq.sort
    end

    def projects
      list = []
      self.each do |task|
        list << task.projects unless task.projects == []
      end
      list.flatten.uniq.sort
    end

    def add(task)
      self.push task
      save
    end

    def complete(task_id)
      self.map! do |task|
        if task.id == task_id
          task.complete
        end
        task
      end
      save
    end

    def id(identifier)
      self.each do |task|
        if task.id == identifier
          return task
        end
      end
    end

    private

    def save
      File.open(@file, 'w') do |file|
        file.puts self
      end
    end

    def completed
      self.select { |task| task.done }
    end

    def incomplete
      self.reject { |task| task.done }
    end
  end
end
