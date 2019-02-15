class AddColumnPenaltyAndSubCategoryToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :penalty, :float, default: 0
    add_column :transactions, :sub_category, :integer
  end
end
