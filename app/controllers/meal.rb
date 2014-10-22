get '/meal' do
  random_lunch_pairings
  erb :meal
end

get '/meal/:id' do
  @lunch = Lunch.find(params[:id])
  erb :individual_meal
end
