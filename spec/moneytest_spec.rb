require 'spec_helper'

describe Money do

  describe 'test Money Class' do 
    it 'get initialize' do
      money = Money.new(50, 'USD')
    end
  end

  describe 'test Convert Method' do 
    it 'get convert' do
      fifty_eur = Money.new(50, 'EUR')
      conv_usd = fifty_eur.convert('USD')
      expect(conv_usd).to have_attributes(amount: 55.50000000000001, currency: 'USD')     
    end
  end

  describe 'test amount method' do
    it 'get amount' do
      money = Money.new(50, 'USD')
      expect(money.amount).to eql(50)
    end
  end

  describe 'test currency method' do
    it 'get currency' do
      money = Money.new(50, 'USD')
      expect(money.currency).to eql('USD')
    end
  end

end