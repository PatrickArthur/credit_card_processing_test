require 'process_card_data'
require 'account'
require 'credit_card'
require 'pry'

describe ProcessCardData do

  it "reads in file and processes card, charges and credits" do
    filepath = "input.txt"
    accounts = Accounts.new
    File.open(filepath).each do |line|
      ProcessCardData.new(line, accounts).process_card_data
    end

    expect(accounts.credit_cards.map {|x| x.balance}).to eq([500, -93, 0])
  end


  it "reads in file and errors on bad credit card numbers" do
    filepath = "input_bad.txt"
    accounts = Accounts.new
    File.open(filepath).each do |line|
      ProcessCardData.new(line, accounts).process_card_data
    end
    expect(accounts.credit_cards.map {|x| x.balance}).to eq([0, 0, 0])
  end

end