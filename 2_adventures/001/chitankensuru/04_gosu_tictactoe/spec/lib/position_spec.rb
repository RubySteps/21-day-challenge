require 'position'
require 'rspec/its'

describe Position do
  its(:board) { should == %w(-)*9 }
  its(:turn) { should == "x" }

  context ".new(board,turn)" do
    subject { Position.new(%w(x - - - - - - - -), "o") }
    its(:board) { should == %w(x - - - - - - - -) }
    its (:turn) { should == "o" }
  end

  context "#move" do
    subject { Position.new.move(0) }
    its(:board) { should == %w(x - - - - - - - -) }
    its (:turn) { should == "o" }
  end
end