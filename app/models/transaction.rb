class Transaction < ApplicationRecord
  belongs_to :member

  validates :transaction_id, :amount_paid, :on_date, :category, presence: true
  enum category: ["Maintenance"]
  enum status: ["NotVerified", "Verified", "NotReceived", "Failed"]
end
