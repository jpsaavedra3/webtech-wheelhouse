module ApplicationHelper
  def money(amount)
    number_to_currency(amount, unit: "$", precision: 0, delimiter: ".")
  end

  def overdue?(repair)
    repair.promised_on < Date.current && repair.state != "collected"
  end
end
