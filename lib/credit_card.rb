require 'luhn'

class CreditCard
	attr_accessor :user_name, :credit_card_number, :limit, :balance, :error
	
	def initialize(user_name, credit_card_number, limit)
		@user_name = user_name
		@credit_card_number = credit_card_number
		@limit = limit
		@balance = 0
		@error = false
	end

	def validate_credit_card
		Luhn.valid? credit_card_number || credit_card_number.length <= 19
	end
end