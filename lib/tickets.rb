class Ticket
  attr_accessor :away, :home, :details
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

  def self.this_weeks_games
    all.each do |game|
      puts "#{game.away} at #{game.home}"
    end
  end

  def self.find_tickets(team)
    all.select {|game| game.away == team || game.home == team }
  end

end
