class Transaction < ApplicationRecord
  belongs_to :member

  validates :payment_mode, :transaction_id, :amount_paid, :on_date, :category, presence: true
  validates_uniqueness_of :transaction_id, scope: %i[category member_id], message: "already exists"

  enum payment_mode: ["Online", "Cheque", "Cash"]
  enum category: ["Maintenance", "PartyHall", "CorpusFund", "Penalty"]
  enum status: ["NotVerified", "Verified", "NotReceived", "Failed"]

  def verified?
    self.status == "Verified"
  end
end
