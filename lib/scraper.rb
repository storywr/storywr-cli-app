require 'nokogiri'
require 'open-uri'

class Scraper

	def get_games
		doc = Nokogiri::HTML(http://www.espn.com/nfl/schedule)
		scraped_games = []
		counter = 0
		games = doc.css(".schedule has-team-logos align-left tr")
		games.each do |game|
			away = game.css("td a .team-name").text
			home = game.css("td a .home .team-name").text
			away.sub("#{home}", "")
			scraped_games << "#{counter}. #{away} at #{home}"
			counter += 1
		end
	end

	def tickets(game_number)
	end





end
