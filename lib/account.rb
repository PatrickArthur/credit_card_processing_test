class Accounts
	attr_accessor :credit_cards
	
	def initialize()
		@credit_cards = []
	end

	def process_charge(user, charge_amount)
		credit_card = credit_cards.select {|x| x.user_name == user}.last
		if credit_card.validate_credit_card
			update_val = credit_card.balance + charge_amount.gsub(/\D/,'').to_i
			if update_val < credit_card.limit.gsub(/\D/,'').to_i
				credit_card.balance = credit_card.balance + charge_amount.gsub(/\D/,'').to_i			
			end
		else
			credit_card.error = true
		end
	end

	def process_credit(user, credit_amount)
		credit_card = credit_cards.select {|x| x.user_name == user}.last
		if credit_card.validate_credit_card
			credit_card.balance = credit_card.balance - credit_amount.gsub(/\D/,'').to_i
		else
			credit_card.error = true
		end
	end

	def add_card(user, credit_card, limit)
		self.credit_cards << CreditCard.new(user, credit_card, limit)
	end

	def user_prompt
		prompt = TTY::Prompt.new
		add = prompt.ask("Would you like to add a card, charge or credit")
		vals = add.split(" ")
		@type = vals.first
	end
end
