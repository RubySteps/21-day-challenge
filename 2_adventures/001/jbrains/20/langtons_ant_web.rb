require "sinatra/base"
require "tilt/erb"
require "./langtons_ant"

class InMemoryWalkListener < WalkListener
  def step_taken(number, ant)
    @number, @ant = number, ant
  end

  def color_flipped(location, color)
    # Intentionally do nothing
  end
end

class LangtonsAntWebApp < Sinatra::Application
  get "/go" do
    @walk_listener = InMemoryWalkListener.new
    @walk = LangtonsAntWalk.new(@walk_listener)
    erb "<h1>Starting a new walk</h1>"
  end

  run! if app_file == $0
end

