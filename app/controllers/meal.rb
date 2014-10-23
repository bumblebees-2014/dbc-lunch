get '/meal' do
  @lunches = UpcomingLunch.all
  erb :meal
end

get '/meal/all' do
  erb :all_meals
end

get '/meal/:id' do
  @lunch = UpcomingLunch.find(params[:id])
  erb :individual_meal
end

patch '/meal/:id' do
  lunch = UpcomingLunch.find(params[:id])
  p "*"*30
  p params[:lunch]
  p "*"*30
  lunch.update_attributes(params[:lunch])
  redirect '/meal'
  response = "My ajax works. But my app doesnt...".to_json
end
