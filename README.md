The following program reads in a txt file with inputs related to adding a users credit_card and processing charges.

The following code can be ran two ways, first by reading in the text file ruby add_card.rb input.txt
or by using STDIN cat input.txt | ./add_card.rb

The code starts with a class called accounts that adds the credit_cards of the users in the spreadsheet, depending on the text file, the code will add a credit_card to accounts and then process the charges and credits. The credit card model has a validation that checks if the credit_card number is valid. If it is, the code will process else it will not processd and flag the record as an error when printed to STDOUT.

Will need to run bundle install to intall Luhn gem which was used for the luhn check and will need to run bundle exec rspec to run tests.