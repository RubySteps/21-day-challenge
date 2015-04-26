require 'sinatra'

class SimpleApp < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/about' do
  	erb :about
  end
end

