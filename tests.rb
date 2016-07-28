require 'minitest/autorun'
require_relative './MaxProfit.rb'

class TestMaxProfit < MiniTest::Test
	# def setup
	# end

	# def test_simple_small_arr
	# 	actual = MaxProfit.find_max_profit([1,2,3])
	# 	assert_equal 2, actual  
	# end

	# def test_simple_bigger_arr
	# 	actual = MaxProfit.find_max_profit([5,4,3,10,9,8,1,2,7])
	# 	assert_equal 7, actual
	# end

	# def test_difficult_small_arr
	# 	actual = MaxProfit.find_max_profit([5,13,3,12])
	# 	assert_equal 9, actual
	# end

	# def test_simple_small_arr_2
	# 	actual = MaxProfit.find_max_profit_2([1,2,3])
	# 	assert_equal 2, actual  
	# end

	# def test_simple_bigger_arr_2
	# 	actual = MaxProfit.find_max_profit_2([5,4,3,10,9,8,1,2,7])
	# 	assert_equal 7, actual
	# end

	# def test_difficult_small_arr_2
	# 	actual = MaxProfit.find_max_profit_2([5,13,3,12])
	# 	assert_equal 9, actual
	# end

	def test_simple_small_arr
		actual = MaxProfit.find_max_profit_efficient([1,2,3])
		assert_equal 2, actual  
	end

	def test_simple_small_arr
		actual = MaxProfit.find_max_profit_efficient([4,3,1,2])
		assert_equal 1, actual  
	end

	def test_simple_bigger_arr
		actual = MaxProfit.find_max_profit_efficient([5,4,3,10,9,8,1,2,7])
		assert_equal 7, actual
	end

	def test_difficult_small_arr
		actual = MaxProfit.find_max_profit_efficient([5,13,3,12])
		assert_equal 9, actual
	end
end
