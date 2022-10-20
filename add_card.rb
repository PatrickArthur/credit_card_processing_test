require './lib/credit_card.rb'
require './lib/account.rb'
require './lib/process_card_data.rb'
require 'pry'
require "tty-prompt"

accounts = Accounts.new()


if ARGV.empty?
	prompt = TTY::Prompt.new

	loop do
		add = prompt.ask("Choose your selection, Add/Charge/Credit or Process")
		vals = add.split(" ")
		type = vals.first
		if type == "Add"
			accounts.add_card(vals[1], vals[2], vals[3])
		elsif type == "Charge"
			accounts.process_charge(vals[1], vals[2])
		elsif type == "Credit"
			accounts.process_credit(vals[1], vals[2])
		end
		break if type == "Process"
	end
else
	if $stdin.tty?
		File.open(ARGV[0]).each do |line|
			ProcessCardData.new(line, accounts).process_card_data
		end
	else
		STDIN.each_line do |line|
			ProcessCardData.new(line, accounts).process_card_data
		end
	end
end

if accounts.credit_cards.empty?
	$stdout << "No Credit Cards Added "
else
	accounts.credit_cards.sort_by(&:user_name).each do |card|
		bal = "$" + card.balance.to_s
		$stdout << "#{card.user_name}: #{card.error ? "error" : bal}, "
	end
end
