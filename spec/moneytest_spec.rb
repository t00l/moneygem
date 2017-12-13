require 'spec_helper'

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