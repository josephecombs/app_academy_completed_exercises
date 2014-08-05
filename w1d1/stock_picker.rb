def get_highest(price_array)
  highest_profit = 0
  best_buy_date = 0
  best_sell_date = 0
  
  price_array.each_index do |buy_date|
    (buy_date..price_array.length).each do |sell_date|
      c_diff = price_array[sell_date].to_i - price_array[buy_date].to_i
      if c_diff > highest_profit
        best_buy_date = buy_date
        best_sell_date = sell_date
        highest_profit = c_diff
      end
    end
  end
  [best_buy_date, best_sell_date]
  
end

puts get_highest([20, 21, 22, 16, 32, 16, 12, 13, 30])
puts get_highest([20, 21, 100, 10000, 0, 100000001])