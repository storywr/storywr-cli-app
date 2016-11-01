class Matchup
  attr_accessor :week, :away, :home, :score
  @@all = []

  def initialize(week, away, home)
    @week = week
    @away = away
    @home = home
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

  def add_score(team)
    @score = Score.new(team)
  end

end
