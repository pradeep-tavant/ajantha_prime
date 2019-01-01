class Facility < ApplicationRecord
  validates :name, :category, :phone, presence: true
  enum category: {security: 0, house_keeping: 1, stp: 2, wtp: 3, lift: 4, gym: 5, play_area: 6, pool: 7, other: 8}
end
