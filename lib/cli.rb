class CLI

	def call
		start
	end


	def start
		puts "Welcome to NFL Helper!"
		puts "Enter the NFL week number you would like to see."
		input = gets.strip.to_s
		puts ""
		puts "NFL Games this Week:"
		Scraper.get_games(input)
		Scraper.show_games
		puts "Would you like to check ticket prices? (y/n)"
		input = gets.strip
		if input == "y"
			puts "Enter the corresponding number of the game you would like to see"
			input = gets.strip
			Scraper.ticket_prices(input)
		end
	end

end
