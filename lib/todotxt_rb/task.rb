module TodotxtRb
  class Task

    attr_accessor :added, :completed, :contexts, :done, :priority, :projects

    def initialize(string)
      date_matcher = /\d{4}-\d{2}-\d{2}/
      context_matcher = /@\b\w+/
      project_matcher = /\+\b\w+/
      self.contexts = []
      self.projects = []
      if date_matcher.match(string)
        self.added = Date.parse(date_matcher.match(string)[0])
      else
        self.added = Date.today
      end
      context_match = context_matcher.match(string)
      if context_match
        self.contexts.push context_match[0]
      end
      project_match = project_matcher.match(string)
      if project_match
        self.projects.push project_match[0]
      end
    end

    def done?
      self.done
    end

    def has_context?(context)
      @contexts.include? context
    end

    def has_project?(project)
      @projects.include? project
    end
  end
end
