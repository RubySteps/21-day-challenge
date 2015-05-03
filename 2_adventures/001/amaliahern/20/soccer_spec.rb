require './soccer'

describe SoccerReader do
  describe "Utility methods" do
    let(:soccer_reader) { SoccerReader.new }

    before(:each) do
      @data = soccer_reader.read("football.dat")
    end

    it "filters the header line" do
      @data.should_not include("Pts \n")
    end
  end
end
