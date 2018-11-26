class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :name
      t.belongs_to :member
      t.string :email
      t.string :phone
      t.boolean :active, default: true
      t.timestamps
    end
    change_table :members do |t|
      t.boolean :rented, default: false
    end
  end
end
