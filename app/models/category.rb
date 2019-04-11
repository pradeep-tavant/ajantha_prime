class Category < ApplicationRecord
  has_many :facilities
  has_many :inventories
  validates :name, presence: true
end
