require 'nokogiri'
require 'open-uri'

class Scraper

	def self.get_games(week)
		doc = Nokogiri::HTML(open("http://www.espn.com/nfl/schedule/_/week/#{week}"))
		games = doc.css("#sched-container .responsive-table-wrap tr")
		games.each do |game|
			home = game.css(".home .team-name span").text
			unless home == ""
				Ticket.new({
					details: game.css(".tickets").text,
					home: home,
					away: game.css(".team-name span").text.sub("#{home}", "")
				})
			end
		end
	end

	def self.get_stats(week)
		doc = Nokogiri::HTML(open("http://www.espn.com/nfl/schedule/_/week/#{week}"))
		counter = 1
		games = doc.css("#sched-container .responsive-table-wrap tr")
		games.each do |game|
			home = game.css(".home .team-name span").text
			links = game.css("td a").map { |link| link["href"] }
			unless home == ""
				Scores.new({
					number: counter,
					score: game.css("td")[2].text,
					headline_url: "http://www.espn.com#{links[4]}"
					})
				counter += 1
			end
		end
	end

end
