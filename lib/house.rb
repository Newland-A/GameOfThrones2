class HOUSES

  attr_accessor :name, :url, :region, :coat_of_arms, :titles, :ancestral_weapons

  @@all = []

  def initialize(name, url)
    #hey if you plan on making a new one of me as in cl
    #merge files using git pull
    self.name = name
    self.url = url
    @@all << self
  end

  def self.all
    @@all
  end

end
#may be needed later for extra features 

# self.region = realm[:region]
    # self.coat_of_arms = realm[:coatOfArms]
    # self.titles = realm[:titles]
    # self.ancestral_weapons = realm[:ancestralWeapons]