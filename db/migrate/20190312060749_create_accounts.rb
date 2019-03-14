class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :title
      t.integer :account_type, default: 0
      t.string :invoice_id
      t.float :amount, default: 0
      t.integer :payment_mode, default: 0
      t.date :on_date, default: Date.today
      t.string :for_month, default: Date.today.strftime("%b-%Y")
      t.text :description
      t.belongs_to :member
      t.timestamps
    end
  end
end
