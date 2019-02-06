class ChangeColumnApprovedToBookings < ActiveRecord::Migration[5.2]
  def self.up
    change_column_default(:bookings, :approved, nil)
    change_column :bookings, :approved, :integer, using: 'approved::integer'
    change_column_default(:bookings, :approved, 0)
  end

  def self.down
    change_column_default(:bookings, :approved, nil)
    change_column :bookings, :approved, :boolean, using: 'approved::boolean'
    change_column_default(:bookings, :approved, false)
  end
end
