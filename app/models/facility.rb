class Facility < ApplicationRecord
  belongs_to :category
  validates :name, :category_id, :phone, presence: true
end
