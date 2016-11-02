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
		puts "Would you like to read the headlines? (y/n)"
		answer = gets.strip.downcase
		if answer == "y"
			headlines
		else
			puts
			puts "Bye!"
		end
	end

	def headlines
		puts
		puts "Enter the corresponding number of the game you would like to read about, or type 'all' for all headlines."
		input = gets.strip.downcase
		if input == "all"
			Scores.all_headlines
		else
			Scores.game_headlines(input)
		end
	end

end
