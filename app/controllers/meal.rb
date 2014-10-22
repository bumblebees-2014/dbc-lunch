get '/meal' do
  random_lunch_pairings
  erb :meal
end
