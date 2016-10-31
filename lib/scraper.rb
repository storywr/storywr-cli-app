require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
	attr_reader :scraped_games, :tickets

	def self.get_games(week)
		doc = Nokogiri::HTML(open("http://www.espn.com/nfl/schedule/_/week/#{week}"))
		@scraped_games = []
		@tickets = {}
		counter = 1
		games = doc.css("#sched-container .responsive-table-wrap tr")
		games.each do |game|
			away = game.css(".team-name").text
			home = game.css(".home .team-name").text
			@scraped_games << "#{counter}. #{away} at #{home}"
			@tickets[counter.to_s.to_sym] = game.css("href")
			counter += 1
		end
	end

	def self.show_games
		@scraped_games.each do |game|
			puts game
		end
	end

	def self.ticket_prices(game_number)
		stubhub_url = @tickets[game_number.to_sym]
		doc = Nokogiri::HTML(stubhub_url)
	end

end
