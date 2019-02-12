class Booking < ApplicationRecord
  belongs_to :member
  validates :reason, :on_date, :start_time, :end_time, :guest_count, presence: true
  validate :check_booking_date_time

  enum approved: ["Pending", "Approved", "Declined"]

  default_scope { order(on_date: :asc) }

  def color
    if approved == 'Approved'
      "green"
    elsif approved == 'Declined'
      "red"
    else
      "#999"
    end
  end

  private

  def check_booking_date_time
    same_date = Booking.where(on_date: on_date).where.not(id: self.id)
    same_datetime = same_date.where(start_time: start_time..end_time).or(same_date.where(end_time: start_time..end_time))
    # same_datetime = same_date.where("(start_time > :start_time AND start_time < :end_time) OR (end_time > :start_time AND end_time < :end_time)", start_time: start_time.utc.strftime("%T"), end_time: end_time.utc.strftime("%T"))
    if same_datetime.count > 0
      errors[:base] << "This slot is already booked by another Member"
    end
  end
end
