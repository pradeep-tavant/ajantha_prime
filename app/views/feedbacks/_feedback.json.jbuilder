json.extract! feedback, :id, :subject, :content, :status, :priority, :response, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
