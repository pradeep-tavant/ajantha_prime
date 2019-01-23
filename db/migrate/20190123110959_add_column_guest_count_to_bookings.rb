class AddColumnGuestCountToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :guest_count, :integer
  end
end
