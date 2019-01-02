json.extract! transaction, :id, :transaction_id, :amount_paid, :on_date, :category, :description, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
