json.extract! booking, :id, :reason, :on_date, :start_time, :end_time, :notes, :approved, :created_at, :updated_at
json.url booking_url(booking, format: :json)
