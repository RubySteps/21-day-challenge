require "sinatra/base"
require "tilt/erb"
require "./langtons_ant"

class InMemoryWalkListener < WalkListener
  attr_reader :number, :ant

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

    @location = @walk_listener.ant.location
    @facing = @walk_listener.ant.facing
    @color = @walk_listener.ant.grid.color_of(@location.to_s)

    erb "<h1>Starting a new walk</h1><p>Ant is on <%= @color %> square <%= @location %>, facing <%= @facing %></p>."
  end

  run! if app_file == $0
end

