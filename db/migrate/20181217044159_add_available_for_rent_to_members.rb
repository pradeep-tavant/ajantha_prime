class AddAvailableForRentToMembers < ActiveRecord::Migration[5.1]
  def change
    change_table :members do |t|
      t.boolean :available_for_rent, default: false
    end
  end
end
