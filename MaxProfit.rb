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
		potential_buy_value = nil
		potential_buy_value_index = nil
		needed_sell_value = nil


		prices.each_with_index do |value, index|
			value = value.to_i
			if $DEBUG
				puts "Value:#{value} => index:#{index}"
				puts "BEFORE ----------------"
				puts "buy_value = #{buy_value}"
				puts "buy_index = #{buy_index}"
				puts "sell_value = #{sell_value}"
				puts "sell_index = #{sell_index}"
				puts "profit = #{profit}"
				puts "potential_buy_value = #{potential_buy_value}"
				puts "potential_buy_value_index = #{potential_buy_value_index}"
				puts "needed_sell_value = #{needed_sell_value}"
			end
			# Is it a higher price to sell at? 
			# then update, this always makes sense to do
			if value > sell_value
				# sell at this value
				sell_value = value
				sell_index = index
				# recalculate profit with new sell_value
				profit = sell_value - buy_value
			end

			# Does this value warrant using the potential buy value instead?
			if !needed_sell_value.nil? && value >= needed_sell_value
				buy_value = potential_buy_value
				buy_index = potential_buy_value_index
				sell_value = value
				sell_index = index
				profit = sell_value - buy_value				
				needed_sell_value = buy_value + profit + 1 
			end

			# Is this value lower than our best buy value so far?
			# Then it MIGHT be a better buy value
			if value < buy_value  # also needs to be lower than the current potential buying, assuming not nil
				# Save this as a maybe better buy value
				potential_buy_value = value
				potential_buy_value_index = index
				# Calculate what sell value would warrany updating
				needed_sell_value = value + profit + 1
			end
			if $DEBUG			
				puts "AFTER ----------------"
				puts "buy_value = #{buy_value}"
				puts "buy_index = #{buy_index}"
				puts "sell_value = #{sell_value}"
				puts "sell_index = #{sell_index}"
				puts "profit = #{profit}"
				puts "potential_buy_value = #{potential_buy_value}"
				puts "potential_buy_value_index = #{potential_buy_value_index}"
				puts "needed_sell_value = #{needed_sell_value}"
				puts
			end	
		end

		if $DEBUG
			puts "Buy #{buy_value}"
			puts "Sell #{sell_value}"
			puts
		end
	
		return profit
	end
end
