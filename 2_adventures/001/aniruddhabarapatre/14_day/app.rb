require_relative 'boot'

get '/todos' do
  @todos = ToDo.all
  erb :index, layout: :bootstrap
end
