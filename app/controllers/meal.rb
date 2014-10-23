get '/meal' do
  erb :meal
end

get '/meal/all' do
  erb :all_meals
end

get '/meal/:id' do
  @lunch = UpcomingLunch.find(params[:id])
  erb :individual_meal
end

post '/meal/:id' do
  lunch = UpcomingLunch.find(params[:id])
  # return "lol".to_json
  if lunch.lunchpartner2_accept == true
    lunch.update_attributes(lunchpartner2_accept: false)
  elsif lunch.lunchpartner1_accept == true
    lunch.update_attributes(lunchpartner1_accept: false)
  end
"lol".to_json
  #response = "My ajax works. But my app doesnt..."
end
