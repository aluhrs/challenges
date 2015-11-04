def get_max_profit(spy)
  buy = []
  sell = []

  spy.each_with_index do |p, i|
    puts "p: #{p}"
    puts "buy: #{buy.inspect}"
    puts "sell: #{sell}"
    if buy.empty? || buy[1] > p
      buy = [ i, p ]
    end
    if !sell.empty? && !buy.empty? && sell[0] < buy[0]
      sell = []
    elsif !buy.empty? && i > buy[0] && p > buy[1]
      if (!sell.empty? && p > sell[1]) || sell.empty?
        sell = [ i, p ]
      end
    end
    puts "after buy: #{buy.inspect}"
    puts "after sell: #{sell}"
  end

  profit = 0
  if !buy.empty? && !sell.empty?
    profit = sell[1] - buy[1]
  end
  profit
end

puts get_max_profit([10, 12, 5, 8, 11, 9]) == 6
# returns 6 (buying for $5 and selling for $11)
