module Calculate

  #faltó algo de manejo de errores

  def value_exist(value)
    (value.respond_to?(:to_i) ? value : value.amount)
  end

  def conv_euro(value)
    case value.currency
    when 'EUR'
      value * 1
    when 'USD'
      value * 1.1
    when 'Bitcoin'
      value * 0.0047
    end
  end

  def + (value)
    @amount + conv_euro(value)
  end  
  
  def - (value)
    @amount - conv_euro(value)
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
