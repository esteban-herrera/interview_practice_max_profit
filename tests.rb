require 'minitest/autorun'
require_relative './MaxProfit.rb'

class TestMaxProfit < MiniTest::Test
	def setup
	end

	def test_simple_small_arr
		actual = MaxProfit.find_max_profit([1,2,3])
		assert_equal 2, actual  
	end

	def test_simple_bigger_arr
		actual = MaxProfit.find_max_profit([5,4,3,10,9,8,1,2,7])
		assert_equal 7, actual
	end

end
