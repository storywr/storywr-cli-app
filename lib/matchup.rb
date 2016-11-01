class Matchup
  attr_accessor :week, :away, :home, :score, :tickets, :price
  @@all = []

  def initialize(week, away, home, tickets, price)
    @week = week
    @away = away
    @home = home
    @tickets = tickets
    @price = price
  end

  def self.all
    @@all
  end

  def results
    puts "NFL Scores Week #{week}:"
    @@all.each do |matchup|
      puts "#{matchup.away} #{away.score} , #{matchup.home} #{home.score}"
    end
  end

  def show_tickets
    puts "#{tickets} available from #{price}"
  end

  def add_score(points)
    @score = Score.new(points)
  end

end
