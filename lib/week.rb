class Week
  attr_accessor :number, :team

  @@all = []

  def initialize(number)
    @number = number
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def add_team(team)
    @teams << team
  end

end
