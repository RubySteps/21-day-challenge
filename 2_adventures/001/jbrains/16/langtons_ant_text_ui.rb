require "./langtons_ant"

walk = LangtonsAntWalk.new(ConsoleReportingWalkListener.new)
10_000.times do
  walk.take_a_step
end
