require 'pry'

class Matchup
  attr_accessor :week, :away, :home, :tickets
  @@all = []

  def initialize(week, away, home, tickets)
    @week = week
    @away = away
    @home = home
    @tickets = tickets
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.this_weeks_games
    puts "NFL Games this week:"
    puts
    @@all.each do |matchup|
      puts "#{matchup.away} at #{matchup.home}"
    end
  end

  def self.find_tickets(team)
    @@all.each do |matchup|
      if matchup.away == team || matchup.home == team
        puts matchup.tickets
      end
    end
  end

end
