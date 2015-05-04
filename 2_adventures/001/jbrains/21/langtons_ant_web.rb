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
  enable :sessions
  set :session_secret, "alessinterestingsecret"

  get "/logout" do
    session.clear
    session['walk'] = nil
    session['walk_listener'] = nil
  end

  get "/go" do
    @walk_listener = InMemoryWalkListener.new
    @walk = LangtonsAntWalk.new(@walk_listener)
    session['walk'] = @walk
    session['walk_listener'] = @walk_listener

    @location = @walk_listener.ant.location
    @facing = @walk_listener.ant.facing
    @color = @walk_listener.ant.grid.color_of(@location.to_s)

    erb "<h1>Starting a new walk</h1><p>Ant is on <%= @color %> square <%= @location %>, facing <%= @facing %></p>."
  end

  get "/step" do
    unless session['walk']
      erb %Q{<h1>Nice try</h1><p>You can't step until you've <a href="/go">started a walk</a>.</p></h1>}
    else
      @walk = session['walk']
      @walk_listener = session['walk_listener']

      @walk.step

      @step_number = @walk_listener.number
      @location = @walk_listener.ant.location
      @facing = @walk_listener.ant.facing
      @color = @walk_listener.ant.grid.color_of(@location.to_s)

      erb "<h1>The Ant took a step!</h1><p>After step <%= @step_number %>, the ant is on <%= @color %> square <%= @location %>, facing <%= @facing %>.</p>"
    end
  end

  run! if app_file == $0
end

