class Calculator::FlexratePerQuantity < Calculator
  preference :first_item,      :decimal, :default => 0
  preference :additional_item, :decimal, :default => 0
  preference :max_items,       :decimal, :default => 0

  def self.description
    "Flexible Rate Per Quantity"
  end

  def self.available?(object)
    true
  end

  def self.register
    super
    Coupon.register_calculator(self)
    ShippingMethod.register_calculator(self)
    ShippingRate.register_calculator(self)
  end
  
  def compute(line_items)
     sum = 0
     max = self.preferred_max_items
     number_of_items = line_items.map(&:quantity).sum
     normal_price_items = max > 0 ? (number_of_items / max) + 1 : 0
     discounted_price_items = number_of_items - normal_price_items

     return(
       self.preferred_first_item * normal_price_items + 
       self.preferred_additional_item * discounted_price_items
     )
   end  
end
