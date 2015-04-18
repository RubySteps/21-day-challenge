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

  context "#possible_moves" do
    subject { Position.new.move(0).move(1) }
    its(:possible_moves) { should == [2,3,4,5,6,7,8] }
  end

  context "#win?" do
    it { expect(Position.new.win?("x")).to be_falsey }
    it { expect(Position.new(%w(x x x
                                - - -
                                - - - )).win?("x")).to be true }
    it { expect(Position.new(%w(- - -
                                x x x
                                - - - )).win?("x")).to be true }
    it { expect(Position.new(%w(- - -
                                - - -
                                x x x )).win?("x")).to be true }
    it { expect(Position.new(%w(o - -
                                o - -
                                o - - )).win?("o")).to be true }
    it { expect(Position.new(%w(- o -
                                - o -
                                - o - )).win?("o")).to be true }
    it { expect(Position.new(%w(- - o
                                - - o
                                - - o )).win?("o")).to be true }
    it { expect(Position.new(%w(- - o
                                - o -
                                o - - )).win?("o")).to be true }
    it { expect(Position.new(%w(o - -
                                - o -
                                - - o )).win?("o")).to be true }
  end

  context "#minimax" do
    it { expect(Position.new(%w(x x x - - - - - -), "x").minimax).to eq(100)}
    it { expect(Position.new(%w(o o o - - - - - -), "o").minimax).to eq(-100)}
    it { expect(Position.new(%w(x o x x o x o x o), "x").minimax).to eq(0)}
    it { expect(Position.new(%w(x x - - - - - - -), "x").minimax).to eq(99)}
    it { expect(Position.new(%w(o o - - - - - - -), "o").minimax).to eq(-99)}
    it { expect { timeout(2) { Position.new.minimax }}.not_to raise_error }
  end
end