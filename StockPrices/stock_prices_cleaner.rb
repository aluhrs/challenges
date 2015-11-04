def get_max_profit(stock_prices_yesterday)
  return if stock_prices_yesterday.length < 2

  min_price = stock_prices_yesterday[0]
  max_profit = stock_prices_yesterday[1] - stock_prices_yesterday[0]
  stock_prices_yesterday.each_with_index do |current_price, index|
    next if index == 0
    potential_profit = current_price - min_price
    if potential_profit > max_profit
      max_profit = potential_profit
    end
    if current_price < min_price
      min_price = current_price
    end
  end
  max_profit
end
