class AddColumnSortToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :sort, :bigint, auto_increment: 1
  end
end
