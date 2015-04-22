Today I am doing chp 5 of the rspec book.

Turns out I have a bug in my code from chp 4.  Should fix that first...

Getting this error when I run:
cucumber features/codebreaker_starts_game.feature

    Then I should see "Welcome to Codebreaker!" # features/step_definitions/codebreaker_steps.rb:23
      undefined method `messages' for #<RSpec::Matchers::BuiltIn::Output:0x007f896428dd78> (NoMethodError)


for this step:

Then /^I should see "([^"]*)"$/ do |message|
  expect(output.messages).to include(message)
end

when I replace "output.messages" with "output.puts", I get:

 private method `puts' called for #<RSpec::Matchers::BuiltIn::Output:0x007fda68a7de48> (NoMethodError)

Used pry to see that "output" was nil, it works as expected if I create a new instance of "output".