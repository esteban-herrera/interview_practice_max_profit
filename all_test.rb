require "./MaxProfit.rb"

[1,2,3,4,5,6,7,8].permutation.to_a.each do |p|
	answer_brute = MaxProfit.find_max_profit(p)
	answer_efficient = MaxProfit.find_max_profit_efficient(p)
	if answer_efficient != answer_brute 
		puts "Failed with array #{p.to_s}, expected:#{answer_brute} - actual:#{answer_efficient}"
	end
end
                                                                                        
