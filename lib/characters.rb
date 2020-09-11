class CHARACTERS

  @@all = []

  attr_accessor :name, :url, :gender, :culture, :born, :titles, :aliases

  def initialize(name, url)
    self.name = name
    self.url = url
    # self.gender = character[:gender]
    # self.culture = character[:culture]
    # self.born = character[:born]
    # self.titles = character[:titles]
    @@all << self
  end

  def self.all
    @@all
  end

end