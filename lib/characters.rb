class CHARACTERS

  @@all = []
  #writes 2 methods a writer and a reader 
  attr_accessor :name, :url#, :gender, :culture, :born, :titles, :aliases
  attr_reader :gender, :culture, :born, :titles, :aliases

  def initialize(name, url)
    self.name = name
    self.url = url
    @@all << self
  end

  def self.all
    @@all
  end

end

#may be need later for extra features
#init properties
# self.gender = character[:gender]
    # self.culture = character[:culture]
    # self.born = character[:born]
    # self.titles = character[:titles]