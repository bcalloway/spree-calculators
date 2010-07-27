class Calculator::PerQuantity < Calculator
  preference :amount, :decimal, :default => 0

  def self.description
    "Flat Rate Per Quantity"
  end

  def self.register
    super
    ShippingMethod.register_calculator(self)
    ShippingRate.register_calculator(self)
  end
  
  def compute(line_items)
    #return if order.line_items.nil?
    
    number = 0
    
    line_items.each do |q|
      number += q.quantity
    end
    
    number * self.preferred_amount
  end
  
end
