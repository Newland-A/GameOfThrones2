class HOUSES

  attr_accessor :name, :url, :region, :coat_of_arms, :titles, :ancestral_weapons

  @@all = []

  def initialize(name, url)
    self.name = name
    self.url = url
    # self.region = realm[:region]
    # self.coat_of_arms = realm[:coatOfArms]
    # self.titles = realm[:titles]
    # self.ancestral_weapons = realm[:ancestralWeapons]
    @@all << self
  end

  def self.all
    @@all
  end

end