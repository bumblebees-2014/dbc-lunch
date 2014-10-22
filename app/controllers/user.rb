get '/session' do
  erb :'users/login'
end

get '/user' do
  erb :'users/create_user'
end

get '/logout' do
  session.clear
  redirect '/'
end
