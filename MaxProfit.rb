class MaxProfit
	# BRUTE FORCE
	# Compares every element to every element after itself. O(n^2)
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

	# When checking buy values, you can skip any buy values that aren't lower than the 
	# lowest you've seen.
	# When checking sell values, skip any that aren't higher than the highest you've seen
	# def self.find_max_profit_2(prices)
	# 	profit = 0
	# 	lowest_buy_value = prices[0]
	# 	highest_sell_value = prices[0]

	# 	# checking all possible buy values
	# 	prices.each_with_index do |buy, index|
	# 		next if buy > lowest_buy_value.to_i 
	# 		lowest_buy_value = buy
	# 		# checking all possible sell values
	# 		prices[index..-1].each do |sell|
	# 			# next if sell < highest_sell_value
	# 			highest_sell_value = sell
	# 			prof_from_sale = sell.to_i - buy.to_i
	# 			profit = prof_from_sale > profit ? prof_from_sale : profit
	# 		end
	# 	end
	# 	profit
	# end

	# iterate only once, updating buy and sell prices, and holding potentially better pairs too. 
	# check at the very end.
	def self.find_max_profit_efficient(prices)
		buy_value = prices[0]
		buy_index = 0
		sell_value = prices[0]
		sell_index = 0
		profit = 0
		potential_buy_value = prices[0]
		needed_sell_value = potential_buy_value + profit + 1


		prices.each_with_index do |value, index|
			# is it a higher price to sell at? this always makes sense to do
			if value > sell_value
				sell_value = value
				sell_index = index
				profit = sell_value.to_i - buy_value.to_i
			end

			# is it a lower price to buy at?
			if value < buy_value && index < sell_index
				buy_value = value
				profit = sell_value.to_i - buy_value.to_i				
			end
			if value < buy_value && index > sell_index
				# it is a potentially better buying price
				potential_buy_value = value
				needed_sell_value = value + profit + 1
			end

			if value >= needed_sell_value
				buy_value = potential_buy_value
				sell_value = value
				sell_index = index
				needed_sell_value = value
				profit = sell_value.to_i - buy_value.to_i				
			end
		end
		# puts "Buy #{buy_value}"
		# puts "Sell #{sell_value}"
		# puts
		profit
	end
end
