class PastLunch < ActiveRecord::Base
  belongs_to :lunchpartner1, class_name: "User"
  belongs_to :lunchpartner2, class_name: "User"
end
