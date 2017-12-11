require_relative './arithmetic/arithmetic'

class Money
  attr_accessor :amount, :currency
  include Calculate

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

  def amount #monto
    @amount
  end
  
  def currency #divisa
    @currency
  end

  def convert(new_currency) #conversión
    factor_to = new_currency == @@configuration.default_currency ? 1 : @@configuration.conversions[new_currency].to_f 
    factor_from = @currency == @@configuration.default_currency ? 1 : @@configuration.conversions[@currency].to_f
    #si es la misma divisa o no
    Money.new(@amount * factor_to / factor_from, new_currency) #nueva instancia / calculo
  end

end

require_relative './configuration/configuration'
require_relative './error/handle_error'


