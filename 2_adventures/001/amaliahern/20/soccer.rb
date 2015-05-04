class SoccerReader
  attr_reader :data

  def read(filename)
    @data = File.readlines(filename).reject(&no_data)
  end

end
