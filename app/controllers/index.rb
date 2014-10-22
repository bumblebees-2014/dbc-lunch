get '/' do
  erb :index
end

get '/meal' do
  erb :meal
end

# or would we just want 2 models: lunch which is a join table between many users?
