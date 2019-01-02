class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :transaction_id
      t.float :amount_paid
      t.belongs_to :member
      t.date :on_date
      t.integer :category
      t.text :description

      t.timestamps
    end
  end
end
