class Money::CurrencyError < StandardError
  #manejar errores 
  def initialize(currency)
    super("Invalid currency \"#{currency}\"")
  end
end