module TodotxtRb
  class Task

    attr_accessor :added, :completed, :contexts, :done, :priority, :projects,
      :text

    def initialize(string, attributes = {})
      @original_string = string
      date_matcher = /\d{4}-\d{2}-\d{2}/
      context_matcher = /@\b\w+/
      project_matcher = /\+\b\w+/
      priority_matcher = /^x?\s?\((\w)\)/
      text_matcher = /^(x\s)?(\(\w\)\s)?(\d{4}-\d{2}-\d{2}\s){0,2}(.*)/
      self.contexts = []
      self.projects = []
      self.done = /^x\s/.match(string) ? true : false
      priority_match = priority_matcher.match(string)
      self.priority = priority_match ? priority_match[1] : nil
      self.priority = attributes[:priority] if attributes[:priority]
      date_match = date_matcher.match(string)
      if date_match
        if date_matcher.match(date_match.post_match)
          self.completed = Date.parse(date_match[0])
          self.added = Date.parse(date_matcher.match(date_match.post_match)[0])
        else
          self.added = Date.parse(date_match[0])
        end
      else
        self.added = Date.today
      end
      self.added = Date.parse(attributes[:added]) if attributes[:added]
      self.completed = Date.parse(attributes[:completed]) if attributes[:completed]
      context_match = context_matcher.match(string)
      if context_match
        self.contexts.push context_match[0]
        while context_match = context_matcher.match(context_match.post_match)
          self.contexts.push context_match[0]
        end
      end
      if attributes[:contexts]
        attributes[:contexts].each do |context|
          self.contexts.push context if !self.contexts.include? context
        end
      end
      project_match = project_matcher.match(string)
      if project_match
        self.projects.push project_match[0]
        while project_match = project_matcher.match(project_match.post_match)
          self.projects.push project_match[0]
        end
      end
      if attributes[:projects]
        attributes[:projects].each do |project|
          self.projects.push project if !self.projects.include? project
        end
      end
      self.done = attributes[:done] if attributes[:done]
      self.text = text_matcher.match(string)[-1]
    end

    def to_str
      string = ""
      string += "x " if self.done?
      string += "(#{self.priority}) " if self.has_priority?
      string += "#{self.completed} " if self.completed
      string += "#{self.added} " if self.added
      string += "#{self.text} " if self.text
      self.contexts.each do |context|
        unless string.include? context
          string += "#{context} "
        end
      end
      self.projects.each do |project|
        unless string.include? project
          string += "#{project} "
        end
      end
      string.chomp(' ')
    end

    def done?
      self.done
    end

    def has_priority?
      self.priority ? true : false
    end

    def has_context?(context)
      @contexts.include? context
    end

    def has_project?(project)
      @projects.include? project
    end
  end
end
