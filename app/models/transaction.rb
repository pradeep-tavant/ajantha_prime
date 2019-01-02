class Transaction < ApplicationRecord
  belongs_to :member

  validates :transaction_id, :amount_paid, :on_date, :category, presence: true
  enum category: ["Maintenance"]
end
