class User < ActiveRecord::Base
  has_many :past_lunches
  has_one :current_lunch
  has_secure_password

  def self.random_lunch_pairings
    @lunchpartner1 = User.find((1..39).to_a.sample)
    @lunchpartner2 = User.find((1..39).to_a.sample)

    Lunch.create(lunchpartner1: @lunchpartner1, lunchpartner2: @lunchpartner2, location: "Dig Inn", date: Chronic.parse("tomorrow at noon"))

  end

end
