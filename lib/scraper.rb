require 'nokogiri'
require 'open-uri'

class Scraper

	def self.get_games(week)
		doc = Nokogiri::HTML(open("http://www.espn.com/nfl/schedule/_/week/#{week}"))
		games = doc.css("#sched-container .responsive-table-wrap tr")
		games.each do |game|
			ticket = game.css(".tickets").text
			away = game.css(".team-name span").text
			home = game.css(".home .team-name span").text
			away = away.sub("#{home}", "")
			unless home == ""
				Tickets.new(away, home, ticket)
			end
		end
	end

	def self.get_stats(week)
		doc = Nokogiri::HTML(open("http://www.espn.com/nfl/schedule/_/week/#{week}"))
		counter = 1
		games = doc.css("#sched-container .responsive-table-wrap tr")
		games.each do |game|
			score = game.css("td")[2]
			home = game.css(".home .team-name span").text
			unless home == ""
				links = game.css("td a").map { |link| link["href"] }
				headline_url = links[4]
				Scores.new(counter, score.text, "http://www.espn.com#{headline_url}")
				counter += 1
			end
		end
	end

	def self.summary(game)
		doc = Nokogiri::HTML(open(@summaries[game.to_s.to_sym]))
		headline = doc.css("#gamepackage-top-stories header h1").text
		summary = doc.css("#gamepackage-top-stories header p").text
		puts
		puts headline
		puts summary
	end

end
