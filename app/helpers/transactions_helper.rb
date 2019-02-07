module TransactionsHelper
  def transaction_reason(transaction)
    if transaction.category == "Maintenance"
      "Maintenance Charge Jan-Mar'2019 (&#8377; 2500 x 3 months)"
    elsif transaction.category == "PartyHall"
      "Party Hall Booking Charge"
    else
      "Penalty"
    end.html_safe
  end

  def transaction_amount(transaction)
    # if transaction.category == "Maintenance"
    #   2500 * 3
    # elsif transaction.category == "PartyHall"
    #   500
    # else
    #   500
    # end
    transaction.amount_paid
  end
end