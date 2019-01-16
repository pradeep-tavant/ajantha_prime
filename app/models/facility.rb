class Facility < ApplicationRecord
  validates :name, :category, :phone, presence: true
  enum category: ["Manager", "Security", "HouseKeeping", "Stp", "Wtp", "Lift", "Gym", "PlayArea", "Pool", "Electrician", "Plumber", "Garbage", "Grills", "UPVC", "Other"]
end
