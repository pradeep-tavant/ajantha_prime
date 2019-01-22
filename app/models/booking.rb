class Booking < ApplicationRecord
  belongs_to :member
  validates :reason, :on_date, :start_time, :end_time, presence: true
end
