get '/meal' do
  random_lunch_pairings
  erb :meal
end

get '/meal/:id' do
  @lunch = Lunch.find(params[:id])
  random_lunch_pairings
  erb :individual_meal
end

put '/meal/:id' do
  @lunch = Lunch.find(params[:id])
  random_lunch_pairings
  Lunch.update(params[:id], lunchpartner1_accept: true, lunchpartner2_accept: true)

  redirect '/meal'
end
