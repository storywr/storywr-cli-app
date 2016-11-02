class Tickets
  attr_accessor :away, :home, :tickets
  @@all = []

  def initialize(away, home, tickets)
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
    @@all.each do |game|
      puts "#{game.away} at #{game.home}"
    end
  end

  def self.find_tickets(team)
    @@all.each do |game|
      if game.away == team || game.home == team
        puts game.tickets
      end
    end
  end

end
