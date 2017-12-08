module ConvertArit

  class Convert

    
    def initialize(currency)
      @currency = currency
    end
  
    def convert_to(currency)
      case @currency
      when "EUR"
        @amount * 1.11 unless @type == "EUR"
      when "Bitcoin" 
        @amount * 0.0047 unless @type == "Bitcoin"
      when "USD" 
        @amount * 1.11 unless @type == "USD"
      end
    end

  end

end