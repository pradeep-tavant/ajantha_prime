class CreateFacilities < ActiveRecord::Migration[5.1]
  def change
    create_table :facilities do |t|
      t.string :name
      t.integer :category
      t.string :designation
      t.string :phone
      t.string :email
      t.text :address
      t.boolean :shift, default: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
