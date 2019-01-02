class Facility < ApplicationRecord
  validates :name, :category, :phone, presence: true
  enum category: {manager: 1, security: 2, house_keeping: 3, stp: 4, wtp: 5, lift: 6, gym: 7, play_area: 8, pool: 9, electrician: 10, plumber: 11, other: 12}
end
