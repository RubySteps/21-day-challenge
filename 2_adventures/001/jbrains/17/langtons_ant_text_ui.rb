require "./langtons_ant"

def walk(how_many_steps)
  walk = LangtonsAntWalk.new(ConsoleReportingWalkListener.new)
  how_many_steps.times do
    walk.take_a_step
  end
end

walk(20)
