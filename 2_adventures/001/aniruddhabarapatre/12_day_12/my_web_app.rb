require "sinatra"
require "erb"

set :port, 5159
set :bind, '0.0.0.0'

get '/' do
  erb "My first Sinatra app", layout: :bootstrap
end
