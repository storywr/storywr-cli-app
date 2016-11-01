class Team
  attr_accessor :name, :week, :score, :opponent
  @@all = []

  def initialize(name, week, score, opponent)
    @name = name
    @week = week
    @score = score
    @opponent = opponent
  end

  def self.all
    @@all
  end

  def show_all_scores
    @@all.each do |team|
      puts "#{team.name}: #{team.score} , #{team.opponent}: #{team.opponent.score}"
    end
  end
  
end
