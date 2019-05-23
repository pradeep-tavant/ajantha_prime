class AddColumnRrNumberAndFamilySizeToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :rr_number, :string
    add_column :members, :family_size, :integer, default: 0
  end
end
