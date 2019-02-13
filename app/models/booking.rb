class Booking < ApplicationRecord
  belongs_to :member
  validates :reason, :on_date, :start_time, :end_time, :guest_count, presence: true
  validate :valid_on_date?
  validate :check_booking_date_time

  enum approved: ["Pending", "Approved", "Declined"]

  default_scope { order(on_date: :asc) }

  def color
    if approved == 'Approved'
      "green"
    else
      "#999"
    end
  end

  private

  def valid_on_date?
    if on_date < Date.today
      errors.add(:on_date, "should be a future date")
    end
  end

  def check_booking_date_time
    same_date = Booking.where(on_date: on_date).where.not(id: self.id, approved: 'Declined')
    # same_datetime = same_date.where(start_time: start_time..end_time).or(same_date.where(end_time: start_time..end_time))
    same_datetime = same_date.where("(start_time > :start_time AND start_time < :end_time) OR (end_time > :start_time AND end_time < :end_time) OR (:start_time > start_time AND :start_time < end_time) OR (:end_time > start_time AND :end_time < end_time)", start_time: start_time.utc.strftime("%T"), end_time: end_time.utc.strftime("%T"))
    if same_datetime.count > 0
      errors[:base] << "Your function timings clashes with another Resident's booking on same day. Please check the Booking Calendar for available timings"
    end
  end
end
