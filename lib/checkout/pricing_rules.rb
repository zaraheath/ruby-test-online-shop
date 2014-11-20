class PricingRules

  def initialize(rules=nil)
    @rules = rules || []
  end

  def total_discount(checkout)
    #Get the discount from every promotion
    promotions = @rules.reduce(0) do |sum, rule|
      sum + rule.apply(checkout, sum)
    end

    #Subtract the discount from price
    checkout.total_without_promotions - promotions
  end
end
