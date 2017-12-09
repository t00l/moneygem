class Money::Configuration
  attr_accessor :default_currency, :conversions

  def initialize
    @default_currency = 'EUR'
    @conversions = {}
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