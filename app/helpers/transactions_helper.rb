module TransactionsHelper
  def transaction_reason(transaction)
    if transaction.category == "Maintenance"
      "Maintenance Charge #{transaction.sub_category} (&#8377; #{transaction.per_month_maintenace} x 3 months)"
    elsif transaction.category == "CorpusFund"
      "Corpus Fund Installment-#{Transaction.sub_categories[transaction.sub_category]} (#{transaction.sub_category})"
    elsif transaction.category == "PartyHall"
      date = transaction.for_date.try(:strftime, "%d/%b/%Y").to_s
      "Party Hall Booking Charge #{date}"
    else
      transaction.category.titleize
    end.html_safe
  end
end
