require 'spec_helper'

require 'turmite'

RSpec.describe Turmite do

  describe '#state accessor' do

    let!(:turmite) {Turmite.new}

    it 'Defaults to OFF' do
      expect(turmite.state).to eql(0)
    end

    it 'Allows set' do
      turmite.state = 1
      expect(turmite.state).to eql(1)
    end

  end

  describe 'Sense of location' do
    it 'should start out at 0,0 location' do
      turmite = Turmite.new
      expect(turmite.location).to eq [0,0]
    end

    it 'should allow specifying initial location' do
      turmite = Turmite.new(x:1, y:2)
      expect(turmite.location).to eq [1,2]
    end

  end

  describe 'Sense of direction' do
    let(:turmite) {Turmite.new}
    it 'should start out heading NORTH' do
      expect(turmite.direction).to eq Turmite::NORTH
    end

    it 'should allow specifying direction' do
      turmite.direction = Turmite::SOUTH
      expect(turmite.direction).to eq(Turmite::SOUTH)
    end

  end

  describe 'Movement' do
    let(:turmite) {Turmite.new(x:0, y:0, direction: Turmite::NORTH)}
    it 'should move 1 square in the specified direction' do
      turmite.move
      expect(turmite.location).to eq [0,1]
      turmite.direction = Turmite::EAST
      turmite.move
      expect(turmite.location).to eq [1,1]
      turmite.direction = Turmite::SOUTH
      turmite.move
      expect(turmite.location).to eq [1,0]
      turmite.direction = Turmite::WEST
      turmite.move
      expect(turmite.location).to eq [0,0]
    end
  end

  describe 'Knowing your square' do
    it 'should observe the color of the square it is on' do
      turmite = Turmite.new( square: 0)
      expect(turmite.square).to eql(0)
    end
  end
end