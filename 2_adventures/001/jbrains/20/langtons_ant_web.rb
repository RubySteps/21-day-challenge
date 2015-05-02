require "sinatra/base"

class LangtonsAntWebApp < Sinatra::Application
  run! if app_file == $0
end

