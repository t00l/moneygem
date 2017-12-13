require 'spec_helper'

describe 'test arithmetic module' do 

  it 'get convert euro' do
    money = Money.new(50, 'USD')
    money = money.convert('EUR')
    expect(money).to have_attributes(amount: 45.04504504504504, currency: 'EUR')     
  end

  it 'sum instances' do
    usd = Money.new(50, 'USD')
    eur = Money.new(25, 'EUR')
    expect(usd + eur).to eq(75)
  end

  it 'subtract instances' do
    usd = Money.new(50, 'USD')
    eur = Money.new(25, 'EUR')
    expect(usd - eur).to eq(25)
  end

  it 'mult instances' do
    usd = Money.new(50, 'USD')
    eur = Money.new(25, 'EUR')
    expect(usd * eur).to eq(1250)
  end

  it 'divide instances' do
    usd = Money.new(50, 'USD')
    eur = Money.new(25, 'EUR')
    expect(usd / eur).to eq(2)
  end

  it 'higher instances' do
    usd = Money.new(50, 'USD')
    eur = Money.new(25, 'EUR')
    expect(usd > eur).to be true
  end

  it 'less instances' do
    usd = Money.new(50, 'USD')
    eur = Money.new(25, 'EUR')
    expect(eur < usd).to be true
  end

  it 'equal instances' do
    usd_1 = Money.new(50, 'USD')
    usd_2 = Money.new(50, 'USD')
    expect(usd_1 == usd_2).to be true
  end

end