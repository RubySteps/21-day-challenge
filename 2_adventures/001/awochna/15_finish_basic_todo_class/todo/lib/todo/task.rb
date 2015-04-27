module Todo
  class Task

    attr_accessor :priority, :text, :done, :added, :completed,
                  :contexts

    def initialize(string)
      if /^x\s/ =~ string
        @done = true
        string.gsub!(/^x\s/, "")
      else
        @done = false
      end
      if /^\(\w\)\s/ =~ string
        @priority = /^\(\w\)/.match(string)[0][1]
        string.gsub!(/^\(\w\)\s/, "")
      end
      if /^\d{4}-\d{2}-\d{2}\s/ =~ string
        @added = Date.parse(/^\d{4}-\d{2}-\d{2}/.match(string)[0])
        string.gsub!(/^\d{4}-\d{2}-\d{2}\s/, "")
        if /^\d{4}-\d{2}-\d{2}\s/ =~ string
          @completed = Date.parse(/^\d{4}-\d{2}-\d{2}/.match(string)[0])
          string.gsub!(/^\d{4}-\d{2}-\d{2}\s/, "")
        else
          @completed = nil
        end
      else
        @added = Date.today
      end
      @text = string
      @contexts = []
      if /@\w+/ =~ string
        @contexts << /@\w+/.match(string)[0]
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
      @done = true
      @completed = Date.today
    end
  end
end
