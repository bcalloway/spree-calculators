class SpreeCalculatorsExtension < Spree::Extension
  version "1.0"
  description "Provides a few extra calculators for shipping, etc."
  url "http://github.com/bcalloway/spree-calculators"
  
  include Spree::BaseHelper
  
  def activate
    [ Calculator::PerQuantity, Calculator::FlexratePerQuantity ].each(&:register) 
  end
  
end