module Todo
  class Task

    attr_accessor :priority, :text, :done, :added, :completed,
                  :contexts, :projects

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
      # the first date in a task is its added date
      if /^\d{4}-\d{2}-\d{2}\s/ =~ string
        @added = Date.parse(/^\d{4}-\d{2}-\d{2}/.match(string)[0])
        string.gsub!(/^\d{4}-\d{2}-\d{2}\s/, "")
        # the second date (if it has one) is the completed date
        if /^\d{4}-\d{2}-\d{2}\s/ =~ string
          @completed = Date.parse(/^\d{4}-\d{2}-\d{2}/.match(string)[0])
          string.gsub!(/^\d{4}-\d{2}-\d{2}\s/, "")
        else
          @completed = nil
        end
      else
        @added = Date.today
      end

      # What remains now is the task text.
      # I am a fan of using the context or project in the
      # task language, so those are not stripped out first.
      # 
      # Example:
      #
      # Clean desk @work
      
      @text = string
      @contexts = []
      @projects = []
      if /@\w+/ =~ string
        @contexts << /@\w+/.match(string)[0]
      end
      if /\+\w+/ =~ string
        @projects << /\+\w+/.match(string)[0]
      end
    end

    def to_s
      string = ""
      string += "x " if @done
      string += "(#{@priority.upcase}) " if @priority
      string += "#{@added} " if @added
      string += "#{@completed} " if @completed
      string += "#{@text}" if @text
      string
    end

    def complete
      self.done = true
      self.completed = Date.today
    end
  end
end
