class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :block, limit: 1
      t.integer :floor, limit: 1
      t.integer :flat, limit: 2
      t.boolean :owner, default: true
      t.boolean :active, default: true
      t.string :email
      t.string :sec_email
      t.string :phone
      t.string :sec_phone

      t.timestamps
    end
  end
end
