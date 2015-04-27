module Todo
  class TaskList

    attr_reader :file, :tasks

    def initialize(filename)
      @file = filename.path
      array_of_lines = IO.readlines(filename)
      @tasks = []
      array_of_lines.each do |line|
        @tasks << Task.new(line)
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

    def contexts
      list = []
      @tasks.each do |task|
        list << task.contexts unless task.contexts == []
      end
      list.flatten.uniq.sort
    end

    def add(string)
      @tasks << Task.new(string)
    end
  end
end
