require_relative 'test_helper'
require 'yaml'
require 'bigdecimal'

class CheckoutTest < Test::Unit::TestCase

  def setup
	#Load products to array and instance variables
	products = YAML.load(IO.read('lib/checkout/data.yml'))
	products["products"].each do |code, data|
		p = Product.new(code, data["name"], BigDecimal.new(data["price"].to_s))
		self.instance_variable_set(:"@#{code}",
                  p)
	end
	
	#Load promotions
	rules_array = []
	rules = YAML.load(IO.read('lib/checkout/data.yml'))
	rules["promotions"].each do |code, data|
		if data["type"] == "free"
			rules_array << Free.new(code, data["discount"], data["number"])
		elsif data["type"] == "discount"
			rules_array << Discount.new(code, data["discount"], data["number"])
		end
	end
    @co = Checkout.new(PricingRules.new(rules_array))
  end

  def test_1
    [@AM, @AC, @AM, @AM, @CA].each {|item| @co.scan(item)}
    price = @co.total
    assert_equal price, 22.45
  end

  def test_2
    ([@AM]*2).each {|item| @co.scan(item)}
    price = @co.total
    assert_equal price, 3.11
  end

  def test_3
    [@AC, @AC, @AM, @AC].each {|item| @co.scan(item)}
    price = @co.total
    assert_equal price, 16.61
  end
  
  
  

end
