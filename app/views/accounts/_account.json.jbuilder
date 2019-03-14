json.extract! account, :id, :title, :amount, :payment_mode, :on_date, :for_month, :description, :created_at, :updated_at
json.url account_url(account, format: :json)
