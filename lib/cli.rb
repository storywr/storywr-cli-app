class CLI

	def call
		start
	end

	def start
		puts
		puts "Welcome to NFL Scores and Ticket Finder!"
		loop do
			puts "Enter 'Scores' to see scores and headlines of past games and 'Tickets' to find Tickets for upcoming games."
			input = gets.strip.downcase
			if input == "scores"
				scores
				break
			elsif input == "tickets"
				tickets
				break
			else
				puts "Answer not recognized"
			end
		end
	end

	def tickets
		puts
		puts "Enter NFL Week Number"
		week = gets.strip
		puts
		Scraper.get_games(week)
		puts "NFL Games Week #{week}:"
		puts "-----------------------"
		Tickets.this_weeks_games
		puts "-----------------------"
		puts
		puts "Which team would you like to see?"
		team = gets.strip
		puts
		Tickets.find_tickets(team)
	end

	def scores
		puts
		puts "Enter NFL Week Number"
		week = gets.strip
		puts
		puts "NFL Scoreboard Week #{week}:"
		puts "----------------------"
		Scraper.get_stats(week)
		Scores.this_weeks_scores
		puts "----------------------"
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

end
