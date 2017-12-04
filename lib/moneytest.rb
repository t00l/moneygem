require "moneytest/version"

module Moneytest
  class Money

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

    def inspect
      "#{amount} #{@type}"
    end

    # class convert_to(data)
    #   @amount
    # end

  end
end
