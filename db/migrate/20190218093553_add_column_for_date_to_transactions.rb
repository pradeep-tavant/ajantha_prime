class AddColumnForDateToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :for_date, :date
  end
end
