require 'pry'

class ProcessCardData
	attr_accessor :line, :accounts

	def initialize(line, accounts)
		@line = line
		@accounts = accounts
	end

	def process_card_data
		line_split = line.split(" ")
		if line_split.first == "Add"
			accounts.add_card(line_split[1], line_split[2], line_split[3])
		elsif line_split.first == "Charge"
			accounts.process_charge(line_split[1], line_split[2])
		elsif line_split.first == "Credit"
			accounts.process_credit(line_split[1], line_split[2])
		end
	end
end