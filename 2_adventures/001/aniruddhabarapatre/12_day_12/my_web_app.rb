require "sinatra"
require "erb"

set :port, 5159
set :bind, '0.0.0.0'

get '/' do
  @project_name = "RubySteps"
  erb :index, layout: :bootstrap
end
