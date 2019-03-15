class Account < ApplicationRecord
  include RailsSortable::Model
  set_sortable :sort, without_updating_timestamps: true
  
  belongs_to :member

  validates :title, :account_type, :payment_mode, :amount, :on_date, :for_month, presence: true
  validates :amount, numericality: {greater_than: 0}

  enum account_type: {Expense: 0, Income: 1}
  enum payment_mode: {Online: 0, Cheque: 1, Cash: 2}
end
