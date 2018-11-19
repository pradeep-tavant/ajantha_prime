class AddAdminRoleToMembers < ActiveRecord::Migration[5.1]
  def change
    change_table :members do |t|
      t.boolean :admin, default: false
    end
  end
end
