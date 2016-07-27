class MaxProfit
	# BRUTE FORCE
	def self.find_max_profit(prices)
		profit = 0
		prices.each_with_index do |val, index|
			buy = val
			prices[index..-1].each do |sell|
				prof_from_sale = sell.to_i - buy.to_i
				profit = prof_from_sale > profit ? prof_from_sale : profit
			end
		end
		profit
	end
end
