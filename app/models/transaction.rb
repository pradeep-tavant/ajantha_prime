class Transaction < ApplicationRecord
  belongs_to :member

  validates :payment_mode, :transaction_id, :amount_paid, :on_date, :category, presence: true
  validates :sub_category, presence: true, if: -> { self.Maintenance? }
  validates :for_date, presence: true, if: -> { self.PartyHall? }
  validates_uniqueness_of :transaction_id, scope: %i[category member_id], message: "already exists"

  before_save do
    self.sub_category = nil unless self.Maintenance?
    self.for_date = nil unless self.PartyHall?
  end

  enum payment_mode: {Online: 0, Cheque: 1, Cash: 2}
  enum category: {Maintenance: 0, PartyHall: 1, CorpusFund: 2, Penalty: 3}
  enum status: {NotVerified: 0, Verified: 1, NotReceived: 2, Failed: 3}
  
  # ----Enum sub_category START---- #
  counter = 0
  sub_category_hash = {}
  durations = ["Jan-Mar", "Apr-Jun", "Jul-Sep", "Oct-Dec"]
  (2019..Date.today.year).to_a.each do |year|
    durations.each do |d|
      sub_category_hash["#{d} #{year}"] = counter
      counter += 1
    end
  end
  enum sub_category: sub_category_hash.select{|k,v| [0,1].include?(v)}
  # ----Enum sub_category END---- #


  def actual_paid
    self.amount_paid - self.penalty
  end

  def q_num
    Transaction.sub_categories[self.sub_category]
  end

  def year
    self.sub_category.split(' ').last
  end

  def per_month_maintenace
    Setting.send("MAINTENANCE_#{year}_Q#{q_num}_PER_MONTH")
  end

  def due_date
    Setting.send("MAINTENANCE_#{year}_Q#{q_num}_DUE_DATE")
  end
end
