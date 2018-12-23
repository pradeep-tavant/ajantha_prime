class Vehicle < ApplicationRecord
  belongs_to :member

  validates :name, :number, :category, presence: true
  enum category: ["Bike/Scooter", "Car"]
end
