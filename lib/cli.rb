class CLI

	def call
		start
	end


	def start
		puts "Welcome to NFL Ticket Finder!"
		puts "Enter NFL Week Number"
		input = gets.strip.to_s
		puts ""
		puts "NFL Games this Week:"
		Scraper.get_games(input)
		Scraper.show_games
		puts "Would you like to check ticket prices? (y/n)"
		input = gets.strip
		if input == "y"
			puts ""
			puts "Enter corresponding game number or team."
			input = gets.strip
			if input.to_i.to_s == input
				input = input.to_i - 1
				input = input.to_s
			end
			Scraper.ticket_prices(input)
		end
	end

end
