class Lunch < ActiveRecord::Base
  belongs_to :lunchpartner1, class_name: "User"
  belongs_to :lunchpartner2, class_name: "User"

  #def weekly_lunches
   # @week = (1..52).to_a


  #end

end

#array.shuffle!.pop

