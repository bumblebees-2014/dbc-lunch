class Lunch < ActiveRecord::Base
  belongs_to :lunchpartner1, class_name: "User"
  belongs_to :lunchpartner2, class_name: "User"

  # def weekly_lunches
  #  @weeks = (1..52).to_a
  #  @weeks.each do |week|
  #   week.
  #  end



end

#array.shuffle!.pop

