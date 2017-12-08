require "convert/convert" #conversión
require "moneytest/version"
require "arithmetic/arithmetic" #operaciones

class Money
  
  include Arithmetic
  include ConvertArit

  def initialize (amount, type)
    @amount = amount
    @type = type
  end      

  def amount
    @amount
  end
  
  def currency
    @type
  end
  
end

# require "convert/convert" #conversión
# require "arithmetic/arithmetic" #operaciones
