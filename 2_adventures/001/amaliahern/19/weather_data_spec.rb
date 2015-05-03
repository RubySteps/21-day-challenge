require './weather_data'

describe WeatherReader do
  describe "Utility methods" do
    let(:weather_reader) { WeatherReader.new }

    before(:each) do
      @data = weather_reader.read("weather.dat")
    end

    it "filters lines that don't contain weather data" do
      @data.should_not include(" MMU June 2002\n")
    end

    context "given a line containing weather data for a day" do
      let(:line) { "   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5" }
      it "returns the difference between the maximum temperature and minimum temperature" do
        weather_reader.spread.call(line).should == 29
      end
    end

    context "given lines containing weather data for several days" do
      it "returns the smallest temperature spread" do
        weather_reader.smallest_spread.should == 2
      end

      it "returns the date that had the smallest temperature spread" do
        weather_reader.date_of_smallest_spread.should == 14
      end
    end
  end
end
