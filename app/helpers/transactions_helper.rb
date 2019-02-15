module TransactionsHelper
  def transaction_reason(transaction)
    if transaction.category == "Maintenance"
      "Maintenance Charge #{transaction.sub_category} (&#8377; #{transaction.per_month_maintenace} x 3 months)"
    elsif transaction.category == "PartyHall"
      "Party Hall Booking Charge"
    else
      transaction.category.titleize
    end.html_safe
  end
end
