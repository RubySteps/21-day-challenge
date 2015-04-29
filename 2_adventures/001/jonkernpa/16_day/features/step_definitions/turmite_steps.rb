
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

When(/^I move to the next square$/) do
  @turmite.move
end

And(/^the square is (.*)$/) do |color|
  @turmite.square = color.to_i
end

Then(/^I should have turned 90° (.*) and end up facing (.*)$/) do |direction, heading|
  mapper = {east: Turmite::EAST, west: Turmite::WEST, north: Turmite::NORTH, south: Turmite::SOUTH}
  expect(@turmite.direction).to eq(mapper[heading.to_sym])
end

And(/^the square should change to (\d+)$/) do |write_color|
  expect(@turmite.square).to eq write_color.to_i
end

And(/^my state should change to (\d+)$/) do |next_state|
  expect(@turmite.state).to eq next_state.to_i
end

