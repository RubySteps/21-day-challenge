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

  end

  describe 'Sense of direction' do
    it 'should start out heading NORTH' do
      turmite = Turmite.new
      expect(turmite.direction).to eq Turmite::NORTH
    end

  end

  describe 'Knowing your square' do
    it 'should observe the color of the square it is on' do
      turmite = Turmite.new( square: 0)
      expect(turmite.square).to eql(0)
    end
  end
end