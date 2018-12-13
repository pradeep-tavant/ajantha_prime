class AddAdminToggleToMembers < ActiveRecord::Migration[5.1]
  def change
    change_table :members do |t|
      t.boolean :admin_toggle, default: false
    end
  end
end
