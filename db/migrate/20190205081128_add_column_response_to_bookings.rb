class AddColumnResponseToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :response, :text
  end
end
