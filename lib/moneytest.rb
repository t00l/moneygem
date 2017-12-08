class Money
  attr_accessor :amount, :currency

  #################### validación y configuración
  class << self

    def configure
      @@configuration ||= Configuration.new
      yield(@@configuration)
    end

    def validate_currency(currency)
      valid_currencies = @@configuration.conversions.keys #busca las keys del bloque
      valid_currencies += [@@configuration.default_currency]
      raise CurrencyError.new(currency) if ([currency] & valid_currencies).empty?
    end

  end
  ######################################

  def initialize(amount, currency = nil)
    @@configuration ||= Configuration.new #aplico config
    self.class.validate_currency(currency) #valido
    @amount = amount
    @currency = currency || @@configuration.default_currency #si no hay divisa, se agrega la default
  end

  def inspect #monto más divisa
    {amount: @amount, currency: @currency }
  end

  def amount
    @amount
  end
  
  def currency
    @currency
  end

  def convert(new_currency) #conversión
    factor_to = new_currency == @@configuration.default_currency ? 1 : @@configuration.conversions[new_currency].to_f #si es la misma divisa o no
    factor_from = @currency == @@configuration.default_currency ? 1 : @@configuration.conversions[@currency].to_f
    Money.new(@amount * factor_to / factor_from, new_currency)
  end

end

class Money::Configuration
  attr_accessor :default_currency, :conversions

  def initialize
    @default_currency = 'EUR'
    @conversions = {}
  end

end

class Money::CurrencyError < StandardError
  #manejar errores 
  def initialize(currency)
    super("Invalid currency \"#{currency}\"")
  end

end

#configuración default
Money.configure do |cfg|
  cfg.default_currency = "EUR"
  cfg.conversions = {
  'USD' => 1.11,
  'Bitcoin' => 0.0047
  }
end 

# money.gemspec
# lib/money/configuracion.rb
# lib/money/currency_error.rb
# lib/money.rb
# test/money_test.rb

m1 = Money.new(100000, 'EUR')
m2 = m1.convert('EUR')
m3 = m1.convert('USD')
m4 = m1.convert('Bitcoin')
p m1.amount
p m1.currency
puts m1.inspect
puts m2.inspect
puts m3.inspect
puts m4.inspect