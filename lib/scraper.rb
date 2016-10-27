require 'nokogiri'
require 'open-uri'

class Scraper

	def get_games
		doc = Nokogiri::HTML(http://www.espn.com/nfl/schedule)
		scraped_games = []
		away = doc.css(".away .team-name")
		home = doc.css(".home .team-name")
		scraped_games << "#{away} at #{home}"
	end

	def tickets(game_number)
	end





end
