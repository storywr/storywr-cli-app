require 'pry'
class CLI

	def start
		puts
		puts "Welcome to NFL Scores and Ticket Finder!"
		main_menu
	end

	def main_menu
		loop do
			puts "Enter 'Scores' to see scores and headlines of past games and 'Tickets' to find Tickets for upcoming games."
			input = gets.strip.downcase
			if input == "scores"
				scores
			elsif input == "tickets"
				tickets
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
		Ticket.this_weeks_games
		puts "-----------------------"
		puts
		puts "Which team would you like to see?"
		team = gets.strip
		Ticket.find_tickets(team).each do |ticket|
			puts ticket.details
		end
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
		if answer == "y" || answer == "yes"
			headlines
		else
			puts
			puts "Type 'main' for main menu or 'quit' to exit."
			input = gets.strip.downcase
			if input == "quit"
				exit
			elsif input == "main"
				Scores.reset
				Ticket.reset
				main_menu
			else
				exit
			end
		end
	end

	def headlines
		puts
		puts "Enter the corresponding number of the game you would like to read about, or type 'all' for all headlines."
		input = gets.strip.downcase
		loop do
			if input == "all"
				Scores.all_headlines
			else
				Scores.game_headlines(input)
			end
			puts
			puts "Pick another game, go to main menu type 'main', else type 'quit' to exit."
			input = gets.strip.downcase
			if input == "quit"
				exit
			elsif input == "main"
				Scores.reset
				Ticket.reset
				main_menu
			end
		end
	end

end
