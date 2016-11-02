class Scores
  attr_accessor :score, :url
  @@all = []

  def initialize(score, url)
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
    @@all.each do |matchup|
      puts "#{matchup.score}"
    end
  end

end
