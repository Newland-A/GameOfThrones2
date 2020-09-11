class HOUSE 

  attr_accessor :name, :region, :coat_of_arms, :titles, :ancestral_weapons

  @@all = []
  
  def initialize(realm)
    self.region = realm[:region]
    self.coat_of_arms = realm[:coatOfArms]
    self.titles = realm[:titles]
    self.ancestral_weapons = realm[:ancestralWeapons]
    @@all << self
  end

  def self.all
    @@all
  end

end