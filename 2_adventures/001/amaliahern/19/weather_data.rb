class WeatherReader
  attr_reader :data, :spread

  def read(filename)
    @data = File.readlines(filename).reject(&no_data)
  end

  def date_of_smallest_spread
    @data.map(&spread).find_index(smallest_spread) + 1
  end

  def smallest_spread
    @data.map(&spread).min
  end

  def spread
    @spread ||= ->(line) { (temperature(line, :max) - temperature(line, :min)).abs }
  end

  private

    def temperature(line, kind)
      line.match(regex)[kind].to_i
    end

    def no_data
      ->(line) { line.match(regex).nil? }
    end

    def regex
      %r{
        (?<day> \d+){0}
        (?<max> \d+){0}
        (?<min> \d+){0}

        \g<day>\s+\g<max>\s+\g<min>
      }x
  end
end
