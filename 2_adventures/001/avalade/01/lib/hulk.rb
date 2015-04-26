require 'eventmachine'

class Hulk
  @@results = {}
  def self.message(command, text)
    if command == "/vote"
      vote(text)
    elsif command == "/results"
      results()
    end
  end

  def self.results
    'The Hulk winner this week is: no one'
  end

  def self.vote(text)
    @@results[text] = (@@results[text] || 0) + 1
    @@results
  end
end
