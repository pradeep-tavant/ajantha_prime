class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.integer :quantity, default: 1
      t.float :amount, default: 0
      t.date :purchase_date, default: Date.today
      t.float :warranty, default: 0
      t.string :invoice
      t.text :description

      t.timestamps
    end
  end
end
