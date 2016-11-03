require 'nokogiri'
require 'open-uri'

class Scores
  attr_accessor :number, :score, :headline_url
  @@all = []

  def initialize(hash)
    hash.each do |key, value|
      self.send("#{key}=", value)
    end
    save
  end

  def self.all
    @@all
  end

  def self.reset
    all.clear
  end

  def save
    @@all << self
  end

  def self.this_weeks_scores
    all.each do |game|
      puts "#{game.number}. #{game.score}"
    end
  end

  def self.game_headlines(input)
    all.each do |game|
      if game.number == input.to_i
        doc = Nokogiri::HTML(open(game.headline_url))
    		headline = doc.css("#gamepackage-top-stories header h1").text
    		summary = doc.css("#gamepackage-top-stories header p").text
    		puts
    		puts headline
    		puts summary
      end
    end
  end

  def self.all_headlines
    all.each do |game|
      doc = Nokogiri::HTML(open(game.headline_url))
  		headline = doc.css("#gamepackage-top-stories header h1").text
  		summary = doc.css("#gamepackage-top-stories header p").text
  		puts
  		puts headline
  		puts summary
    end
  end

end
