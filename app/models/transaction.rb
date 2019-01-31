class Transaction < ApplicationRecord
  belongs_to :member

  validates :transaction_id, :amount_paid, :on_date, :category, presence: true
  validates_uniqueness_of :transaction_id, scope: %i[category member_id], message: "already exists"

  enum category: ["Maintenance", "PartyHall", "Penalty"]
  enum status: ["NotVerified", "Verified", "NotReceived", "Failed"]

  def verified?
    self.status == "Verified" && self.category == "Maintenance"
  end
end
