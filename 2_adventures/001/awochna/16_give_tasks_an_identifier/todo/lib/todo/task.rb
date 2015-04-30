require 'securerandom'

module Todo
  # Creates a Task object with a provided string.
  class Task

    include Comparable

    attr_accessor :priority, :text, :done, :added, :completed,
                  :contexts, :projects, :id

    # Create a task.
    #
    # @param string [String] the todo.txt formatted string to create a task.
    #
    # Example:
    #
    #   task = Todo::Task.new("Some task")
    #   puts task
    #   #=> 2015-04-29 Some task {id:#{SecureRandom::uuid()}}
    def initialize(string)
      # if task begins with an 'x' it is considered done
      if /^x\s/ =~ string
        @done = true
        string.gsub!(/^x\s/, "")
      else
        @done = false
      end
      # if task starts with a letter in parenthesis, it has
      # that letter's priority
      if /^\(\w\)\s/ =~ string
        @priority = /^\(\w\)/.match(string)[0][1]
        string.gsub!(/^\(\w\)\s/, "")
      end
      # if there are two dates, the first is the completed
      # and the second one is the added date.
      if /^\d{4}-\d{2}-\d{2}\s\d{4}-\d{2}-\d{2}\s/ =~ string
        @completed = Date.parse(/^\d{4}-\d{2}-\d{2}/.match(string)[0])
        string.sub!(/^\d{4}-\d{2}-\d{2}\s/, "")
        @added = Date.parse(/^\d{4}-\d{2}-\d{2}/.match(string)[0])
        string.sub!(/^\d{4}-\d{2}-\d{2}\s/, "")
      elsif /^\d{4}-\d{2}-\d{2}\s/ =~ string
        @added = Date.parse(/^\d{4}-\d{2}-\d{2}/.match(string)[0])
        string.sub!(/^\d{4}-\d{2}-\d{2}\s/, "")
      else
        @added = Date.today
      end

      # if there is an {id:####}, then set the id to that
      # otherwise generate a new one

      if /\{id:.*\}/ =~ string
        @id = /\{id:(.*)\}/.match(string)[1]
        string.sub!(/\s\{id:.*\}/, "")
      else
        @id = SecureRandom::uuid()
      end

      # What remains now is the task text.
      # I am a fan of using the context or project in the task language, so
      # those are not stripped out first.
      #
      # Example:
      #
      #   Clean desk @work
      #
      # Can read as "clean desk at work".

      @text = string.chomp
      @contexts = []
      @projects = []
      if /@\w+/ =~ string
        @contexts << /@\w+/.match(string)[0]
      end
      if /\+\w+/ =~ string
        @projects << /\+\w+/.match(string)[0]
      end
    end

    # Constructs a string representation of the task in todo.txt format.
    #
    # @return [String] the task in todo.txt format.
    def to_str
      string = ""
      string += "x " if @done
      string += "(#{@priority.upcase}) " if @priority
      string += "#{@completed} " if @completed
      string += "#{@added} " if @added
      string += "#{@text}" if @text
      string += " {id:#{@id}}\n"
      string
    end

    # Mark this task as done and give it a completed date.
    def complete
      self.done = true
      self.completed = Date.today
      if self.done && self.completed == Date.today
        true
      else
        false
      end
    end

    # Implement comparable for Tasks.
    #
    # If a task is marked done, it should sort to the bottom, then tasks
    # without priority, then task with priority ascending from Z to A.
    def <=> other_task
      if self.done && !other_task.done
        return -1
      elsif !self.done && other_task.done
        return 1
      end
      if self.priority.nil? && other_task.priority.nil?
        0
      elsif other_task.priority.nil?
        1
      elsif self.priority.nil?
        -1
      else
        other_task.priority <=> self.priority
      end
    end
  end
end
