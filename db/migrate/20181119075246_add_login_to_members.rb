class AddLoginToMembers < ActiveRecord::Migration[5.1]
  def change
    change_table :members do |t|
      t.string :login
      t.string :slug, null: false
    end
  end
end
