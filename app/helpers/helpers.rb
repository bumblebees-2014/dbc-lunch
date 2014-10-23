helpers do

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def random_lunch_pairings
    array = (1..39).to_a
    @lunchpartner1 = User.find(array.shuffle!.pop)
    @lunchpartner2 = User.find(array.shuffle!.pop)

     Lunch.create(lunchpartner1: @lunchpartner1, lunchpartner2: @lunchpartner2, location: "Dig Inn", date: Chronic.parse("tomorrow at noon"), lunchpartner1_accept: true, lunchpartner2_accept: true)

    #p @lunchpartner1.name + " and " + @lunchpartner2.name

  end

  def decline_lunch
    if @lunchpartner1.lunchpartner1_accept == true
      Lunch.update(lunchpartner1_accept: false)
    end

    if @lunchpartner2.lunchpartner2_accept == true
      Lunch.update(lunchpartner2_accept: false)
    end

  end

end
