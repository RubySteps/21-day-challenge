class AnsweringMachine

  def self.reply(message)
    message.to_s.gsub(/[^a-z0-9\s]/i, '') + "?"
  end

end  