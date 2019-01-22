class Facility < ApplicationRecord
  belongs_to :category
  validates :name, :category, :phone, presence: true
end
