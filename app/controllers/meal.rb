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

put '/meal/:id' do
  @lunch = UpcomingLunch.find(params[:id])
  @lunch.update(params[:lunchpartner1_accept], params[:lunchpartner2_accept])

  redirect '/meal'
  response = "My ajax works. But my app doesnt...".to_json
end
