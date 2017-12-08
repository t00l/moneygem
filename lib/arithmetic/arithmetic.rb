module Arithmetic

  def value_exist(value)
    value.respond_to?(:to_i) ? value : value.amount
  end

  def + (value)
    (@amount + value_exist(value))
  end  
  
  def - (value)
    (@amount - value_exist(value))
  end  
  
  def * (value)
    (@amount * value_exist(value))
  end  
  
  def / (value)
    (@amount / value_exist(value))
  end  
  
  def > (value)
    (@amount > value_exist(value))
  end  
  
  def < (value)
    (@amount < value_exist(value))
  end  
  
  def == (value)
    (@amount == value_exist(value))
  end    
end
