require './weather_data'
describe 'weather data' do
  it 'should open file with weather data if exits' do
     expect(smallestTemperature('weather.dat')).to eq true
  end
end
