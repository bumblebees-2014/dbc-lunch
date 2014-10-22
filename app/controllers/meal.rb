get '/meal' do
  random_lunch_pairings
  erb :meal
end

get '/meal/:id' do
  @lunch = Lunch.find(params[:id])
  random_lunch_pairings
  erb :individual_meal
end
