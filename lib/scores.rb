require 'pry'

class Scores
  attr_accessor :number, :score, :url
  @@all = []

  def initialize(number, score, url)
    @number = number
    @score = score
    @url = url
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.this_weeks_scores
    @@all.each do |game|
      puts "#{game.number}. #{game.score}"
    end
  end

  def self.game_headlines(input)
    @@all.each do |game|
      if game.number == input.to_i
        doc = Nokogiri::HTML(open(game.url))
    		headline = doc.css("#gamepackage-top-stories header h1").text
    		summary = doc.css("#gamepackage-top-stories header p").text
    		puts
    		puts headline
    		puts summary
      end
    end
  end


  def self.all_headlines
    @@all.each do |game|
      doc = Nokogiri::HTML(open(game.url))
  		headline = doc.css("#gamepackage-top-stories header h1").text
  		summary = doc.css("#gamepackage-top-stories header p").text
  		puts
  		puts headline
  		puts summary
    end
  end

end
