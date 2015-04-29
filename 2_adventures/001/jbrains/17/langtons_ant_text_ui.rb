require "./langtons_ant"

walk = LangtonsAntWalk.new(ConsoleReportingWalkListener.new)
20.times do
  walk.take_a_step
end
