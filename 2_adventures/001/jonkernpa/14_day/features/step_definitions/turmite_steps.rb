
Given(/^a turmite is spawned$/) do
  @turmite = Turmite.new
end

Then(/^it should be at location (\d+), (\d+)$/) do |x, y|
  @current_location = @turmite.location
  expect(@current_location).to eq([x.to_i, y.to_i])
end

And(/^it should be heading North$/) do
  expect(@turmite.direction).to eq Turmite::NORTH
end

Given(/^my current state is (.*)$/) do |state|
  @turmite.state = state.to_i
end

When(/^I move to a (.*) square$/) do |color|
  @turmite.square = color.to_i
end

Then(/^I should move 90° (.*) and be facing (.*)$/) do |direction, heading|
  expect(@turmite.direction).to eq(Turmite::EAST)
end

And(/^the square should change to (.*)$/) do |write_color|
  pending
end

And(/^my state should change to (.*)$/) do |next_state|
  pending
end

