helpers do
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def random_lunch_pairings
    array = (1..39).to_a
    @lunchpartner1 = User.find(array.shuffle!.pop)
    @lunchpartner2 = User.find(array.shuffle!.pop)

    Lunch.create(lunchpartner1: @lunchpartner1, lunchpartner2: @lunchpartner2, location: "Dig Inn", date: Chronic.parse("tomorrow at noon"))

    #p @lunchpartner1.name + " and " + @lunchpartner2.name

  end

end
