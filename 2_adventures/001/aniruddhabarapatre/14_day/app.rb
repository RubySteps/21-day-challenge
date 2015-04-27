require_relative 'boot'

get '/todos' do
  @todos = ToDo.all
  erb :index, layout: :bootstrap
end

get '/todos/new' do
  @todos = ToDo.all
  erb :new, layout: :bootstrap
end

post '/todos' do
  @post = ToDo.new(params[:todo])
  @post.save
  redirect '/todos'
end
