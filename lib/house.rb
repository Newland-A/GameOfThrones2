class HOUSE 
  @@all = []
  attr_accessor :name, :region, :coat_of_arms, :titles, :ancestral_weapons
  # name, region, coat_of_arms, titles, ancestral_weapons
  def initialize()
    # :name, :region, :coat_of_arms, :titles, :ancestral_weapons
    @@all << self

  end

  def self.all
    @@all
  end

end