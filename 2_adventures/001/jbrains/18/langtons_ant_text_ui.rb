require "./langtons_ant"

class ConsoleReportingWalkListener < WalkListener
  def step_taken(number, ant)
    puts (number == 0 ? "At the beginning of his walk..." : "After step #{number}")
    describe_walk(ant)
  end

  def describe_walk(ant)
    puts "Langton's ant is now at #{ant.location}, which is #{ant.grid.color_of(ant.location).to_s}"
    puts "He is facing #{ant.facing}"
    puts "He sees black squares at #{ant.grid.describe()}"
  end

  def color_flipped(location, color)
    puts "The square at #{location} is changing to #{color}"
  end
end

LangtonsAntWalk.new(ConsoleReportingWalkListener.new).walk(20)
