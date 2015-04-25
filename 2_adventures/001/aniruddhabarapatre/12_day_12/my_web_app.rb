require "sinatra"
require "erb"

set :port, 5159
set :bind, '0.0.0.0'

get '/' do
  "My first Sinatra app"
end
