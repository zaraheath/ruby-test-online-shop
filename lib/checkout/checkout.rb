class Checkout
  attr_reader :basket

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @basket = []
  end

  def scan(product)
    @basket << product
  end

  def total_without_promotions
    @basket.map(&:price).reduce(:+)
  end

  def total
    @pricing_rules.total_discount(self)
  end

end
