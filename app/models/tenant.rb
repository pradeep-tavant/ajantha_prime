class Tenant < ApplicationRecord
  belongs_to :member
  # validates :name, :email, :phone, presence: true
end
