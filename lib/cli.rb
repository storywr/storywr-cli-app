class CLI

	def call
		Scraper.get_games(10)
		Matchup.this_weeks_games
		puts
		puts
		Matchup.find_tickets("Miami")
	end

	def start
		puts
		puts "Welcome to NFL Scores and Ticket Finder!"
		loop do
			puts "Enter 'Scores' to see NFL scores and headlines and 'Tickets' to find Tickets for upcoming games."
			input = gets.strip.downcase
			if input == "scores"
				find_stats
				break
			elsif input == "tickets"
				find_tickets
				break
			else
				puts "Answer not recognized"
			end
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
		puts "Enter corresponding number for game summary."
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
