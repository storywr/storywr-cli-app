class CLI

	def call
		start
	end


	def start
		puts
		puts "Welcome to NFL Stats and Ticket Finder!"
		puts "Enter 'Stats' to see NFL scores and stat lines and 'Tickets' to find Tickets for upcoming games."
		input = gets.strip
		if input == "Stats"
			find_stats
		elsif input == "Tickets"
			find_tickets
		end
	end

	def find_stats
		puts
		puts "Enter NFL Week Number"
		week = gets.strip
		Scraper.get_stats(week)
		puts
		puts "NFL Scores Week #{week}:"
		Scraper.game_scores
		puts
		puts "Which game would you like the summary for?"
		game = gets.strip
		Scraper.summary(game)
	end

	def find_tickets
		puts
		puts "Enter NFL Week Number"
		week = gets.strip
		display_games(week)
		puts
		puts "Enter corresponding game number or team name."
		input = gets.strip
		Scraper.ticket_prices(input)
	end

	def display_games(week)
		puts
		puts "NFL Games Week #{week}:"
		Scraper.get_games(week)
		Scraper.show_games
	end

end
