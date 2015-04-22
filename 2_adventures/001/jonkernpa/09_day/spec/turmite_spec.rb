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
end