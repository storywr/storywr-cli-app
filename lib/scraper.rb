require 'nokogiri'
require 'open-uri'

class Scraper
	attr_reader :scraped_games, :tickets

	def self.get_games
		doc = Nokogiri::HTML(http://www.espn.com/nfl/schedule)
		@scraped_games = []
		@tickets = {}
		counter = 1
		games = doc.css(".schedule has-team-logos align-left tr")
		games.each do |game|
			away = game.css("td a .team-name").text
			home = game.css("td a .home .team-name").text
			away.sub("#{home}", "")
			@scraped_games << "#{counter}. #{away} at #{home}"
			@tickets[counter.to_sym] = game.css("href")
			counter += 1
		end
	end

	def self.games
		@scraped_games.each do |game|
			puts game
		end
	end

	def tickets(game_number)
		stubhub_url = @tickets[game_number.to_sym]
		doc = Nokogiri::HTML(stubhub_url)
	end

end
