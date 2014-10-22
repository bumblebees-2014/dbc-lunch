enable :sessions

get '/session' do
  erb :'users/login'
end

post '/session' do

  user = User.find_by_username(params[:username])

  if user.nil?
    session[:error] = "Login failed"
    redirect "/session"
  end

  user = user.authenticate(params[:password])

  if user
    session[:user_id] = user.id
    redirect "/meal"
  else
    session[:error] = "Login failed"
    redirect '/session'
  end

end

get '/user' do
  erb :'users/create_user'
end

post '/user' do
  user = User.new(params[:user])
  if user.valid?
    user.save
    redirect '/session'
  else
    redirect '/user'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
