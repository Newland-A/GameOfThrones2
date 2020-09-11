class API

  def self.create_characters
    #goes out and gets the information from the API
    response = RestClient.get('https://anapioficeandfire.com/api/characters?page=3&pageSize=25')
    # binding.pry
    #returns that information in a parsed hash sy
    got_hash = JSON.parse(response.body, symbolize_names:true)
    #selects the main key in the hash
    # char_array = got_hash[:name]
    #then iterates through the hash and returns the elements
    got_hash.each do | character |
      url = character[:url]
      name = character[:name]
      CHARACTERS.new(name, url)
   #binding.pry true
    end
  #binding.pry
  end

  #binding.pry

  def self.character_list(character)
    response = RestClient.get(character.url)
    char_hash = JSON.parse(response.body, symbolize_names:true)
    # character.name = char_hash[:name]
    # binding.pry
    character.gender = char_hash[:gender]
    character.culture = char_hash[:culture]
    character.born = char_hash[:born]
    character.titles = char_hash[:titles]
    character.aliases = char_hash[:aliases]
   # binding.pry
  end
 
  def self.create_houses
  #goes out and gets the information from the API
    response = RestClient.get('https://anapioficeandfire.com/api/houses/')
  #returns that information in a parsed hash, symbolize turns all the keys a different color for easier readability
    house_hash = JSON.parse(response.body, symbolize_names:true)
  #selects the main key in the hash
    # house_array = house_hash[:name]
  #then iterates through the hash and returns the elements

  #it does not like the collect key word, Try to find a fix in the morning after a break.
    house_hash.each do |realm|
      house = realm[:name]
      HOUSES.new(house)
    end
#binding.pry
  end

  #binding.pry

  def self.house_list(house)
    response = RestClient.get(house.url)
    house_hash = JSON.parse(response.body, symbolize_names:true)
    house.gender = house_hash[:region]
    house.culture = house_hash[:coatOfArms]
    house.titles = house_hash[:titles]
    house.aliases = house_hash[:ancestralWeapons]
   # binding.pry
  end

end