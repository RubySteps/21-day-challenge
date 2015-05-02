def smallestTemperature(file)
  File.readlines('weather.dat').each do |line|
    tempArray << line
  end
  tempArray.delete_at(0)
  tempArray.delete_at(1)  
  tempArray    
end
