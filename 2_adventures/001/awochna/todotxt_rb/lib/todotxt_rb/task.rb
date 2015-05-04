module TodotxtRb
  class Task

    attr_accessor :added, :completed, :contexts, :done, :priority, :projects,
      :text

    def initialize(string, attrs = {})
      text_matcher = /^(x\s)?(\(\w\)\s)?(\d{4}-\d{2}-\d{2}\s){0,2}(.*)/
      text_match = text_matcher.match(string)
      self.done = text_match[1] ? true : false
      set_priority(text_match[2], attrs[:priority])
      set_added_completed_dates(string, attrs[:completed], attrs[:added])
      set_contexts(string, attrs[:contexts])
      set_projects(string, attrs[:projects])
      self.done = attrs.fetch(:done, self.done)
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

    private

    def set_priority(matcher, attribute)
      if attribute
        self.priority = attribute
      elsif matcher
        self.priority = matcher[1]
      else
        self.priority = nil
      end
    end

    def set_added_completed_dates(string, completed, added)
      date_matcher = /\d{4}-\d{2}-\d{2}/
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
      self.added = Date.parse(added) if added
      self.completed = Date.parse(completed) if completed
    end

    def set_contexts(string, attributes)
      context_matcher = /@\b\w+/
      self.contexts = []
      context_match = context_matcher.match(string)
      if context_match
        self.contexts.push context_match[0]
        while context_match = context_matcher.match(context_match.post_match)
          self.contexts.push context_match[0]
        end
      end
      if attributes
        attributes.each do |context|
          self.contexts.push context if !self.contexts.include? context
        end
      end
    end

    def set_projects(string, attributes)
      project_matcher = /\+\b\w+/
      self.projects = []
      project_match = project_matcher.match(string)
      if project_match
        self.projects.push project_match[0]
        while project_match = project_matcher.match(project_match.post_match)
          self.projects.push project_match[0]
        end
      end
      if attributes
        attributes.each do |project|
          self.projects.push project if !self.projects.include? project
        end
      end
    end
  end
end
