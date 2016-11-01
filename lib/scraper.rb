require 'nokogiri'
require 'open-uri'

class Scraper
	attr_reader :scraped_games, :ticket, :results, :summaries

	def self.get_games(week)
		doc = Nokogiri::HTML(open("http://www.espn.com/nfl/schedule/_/week/#{week}"))
		@scraped_games = []
		@tickets = {}
		counter = 1
		games = doc.css("#sched-container .responsive-table-wrap tr")
		games.each do |game|
			ticket = game.css(".tickets").text
			@tickets[counter.to_s.to_sym] = ticket
			away = game.css(".team-name span").text
			home = game.css(".home .team-name span").text
			away = away.sub("#{home}", "")
			unless home == ""
				@scraped_games << "#{counter}. #{away} at #{home}"
				counter += 1
			end
		end
	end

	def self.get_stats(week)
		doc = Nokogiri::HTML(open("http://www.espn.com/nfl/schedule/_/week/#{week}"))
		@results = []
		@summaries = {}
		counter = 1
		games = doc.css("#sched-container .responsive-table-wrap tr")
		games.each do |game|
			score = game.css("td")[2]
			home = game.css(".home .team-name span").text
			unless home == ""
				links = game.css("td a").map { |link| link["href"] }
				headline_url = links[4]
				@summaries[counter.to_s.to_sym] = "http://www.espn.com#{headline_url}"
				@results << "#{counter}. #{score.text}"
				counter += 1
			end
		end
	end

	def self.show_games
		@scraped_games.each do |game|
			puts game
		end
		puts
	end

	def self.ticket_prices(game)
		puts
		if game.to_i.to_s == game
			puts @tickets[game.to_s.to_sym]
		else
			game_number = @scraped_games.index { |matchup| matchup.include?(game) } + 1
			puts @tickets[game_number.to_s.to_sym]
		end
	end

	def self.game_scores
		puts @results
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
