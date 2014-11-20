class Promotion

  def initialize(rules=[])
    @rules = rules || []
  end

  def apply
  end

  def discount(discounts)
    # Calculates the discount amount from a discount array

    discounts.empty? ? 0 : discounts.reduce(:+)
  end
end

class Discount < Promotion
  def initialize(code, discount, number)
	hash = {code: code, discount: discount, number: number}
	super([hash])
  end

  def apply(checkout, sum=nil)
    # Create array of hashes with quantity and rule to apply

    product_qty, discounts = [], []

    
    @rules.each { |rule| product_qty << {qty: checkout.basket.map(&:code).count(rule[:code]), rule: rule}}

    product_qty.each do |hash|
      discounts << hash[:rule][:discount] * hash[:qty] if hash[:qty] >= hash[:rule][:number]
    end

    discount(discounts)
  end
end

class Free < Promotion
  def initialize(code, discount, number)
	hash = {code: code, discount: discount, number: number}
	super([hash])
  end

  def apply(checkout, sum=nil)
    # Create array of hashes with quantity and rule to apply

    product_qty, discounts = [], []

    @rules.each { |rule| product_qty << {qty: checkout.basket.map(&:code).count(rule[:code]), rule: rule}}

    product_qty.each do |hash|
      discounts << hash[:rule][:discount] * (hash[:qty]/hash[:rule][:number]) if hash[:qty] >= hash[:rule][:number]
    end

    discount(discounts)
  end
end
