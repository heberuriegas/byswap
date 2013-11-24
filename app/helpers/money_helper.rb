module MoneyHelper
  def currencies_today
    if current_currency == 'USD'      
      "1 #{current_currency} ~= #{1.to_money(current_currency).exchange_to(target_currency)} #{target_currency}"
    else
      "1 #{target_currency} ~= #{1.to_money(target_currency).exchange_to(current_currency)} #{target_currency}"
    end
  end
end