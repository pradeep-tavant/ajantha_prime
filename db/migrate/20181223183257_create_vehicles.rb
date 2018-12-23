class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :number
      t.integer :category
      t.belongs_to :member
      t.timestamps
    end
  end
end
