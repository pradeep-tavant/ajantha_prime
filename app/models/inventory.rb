class Inventory < ApplicationRecord
  mount_uploader :invoice, InvoiceUploader

  belongs_to :category

  validates :name, :purchase_date, :warranty, :quantity, :amount, presence: true
  validates :amount, :quantity, numericality: {greater_than: 0}
end
