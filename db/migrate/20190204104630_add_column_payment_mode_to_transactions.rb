class AddColumnPaymentModeToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :payment_mode, :integer, default: 0
  end
end
