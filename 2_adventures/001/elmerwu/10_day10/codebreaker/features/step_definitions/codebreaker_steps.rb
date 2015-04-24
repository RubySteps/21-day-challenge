class Out
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def out
  @out ||= Out.new
end

Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  game = Codebreaker::Game.new(out)
  game.start
end

Then /^I should see "([^"]*)"$/ do |message|
  expect(out.messages).to include(message)
end

