class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.belongs_to :member
      t.string :reason
      t.date :on_date
      t.time :start_time
      t.time :end_time
      t.text :notes
      t.boolean :approved, default: false
      t.timestamps
    end
  end
end
