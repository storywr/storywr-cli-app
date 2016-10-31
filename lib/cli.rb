class CLI

	def call
		puts "Welcome to NFL Helper!"
		puts "Enter 'list' to list games for the current week."
		input = gets.strip
		if input == "list"
			list_games
		end
	end


	def list_games
		puts "NFL Games this Week:"
		Scraper.get_games
		Scraper.show_games
		puts "Would you like to check ticket prices? (y/n)"
		input = gets.strip
		if input == "y"
			puts "Enter the corresponding number of the game you would like to see"
			input = gets.strip.to_i
			Scraper.ticket_prices(input)
		end
	end

end
