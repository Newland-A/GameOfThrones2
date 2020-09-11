class API

  def self.create_characters
    #goes out and gets the information from the API
    response = RestClient.get('https://anapioficeandfire.com/api/characters/583')
    #returns that information in a parsed hash sy
    got_hash = JSON.parse(response.body, symbolize_names:true)
    #selects the main key in the hash
    char_array = got_hash[:name]
    #then iterates through the hash and returns the elements
    got_characters = char_array.collect do | character |
      CLI.new(character)
    end
  end

  binding.pry

  def self.character_list(character)
    response = RestClient.get(character.url)
    char_hash = JSON.parse(response.body, symbolize_names:true)
    character.gender = char_hash[:gender]
    character.culture = char_hash[:culture]
    character.born = char_hash[:born]
    character.titles = char_hash[:titles]
    character.aliases = char_hash[:titles][:aliases]
    binding.pry
  end
 
  def self.create_houses
  #goes out and gets the information from the API
    response = RestClient.get('https://anapioficeandfire.com/api/houses/378')
  #returns that information in a parsed hash sy
    house_hash = JSON.parse(response.body, symbolize_names:true)
  #selects the main key in the hash
    house_array = house_hash[:name]
  #then iterates through the hash and returns the elements
    got_house = house_array.collect do | realm |

      CLI.new(realm)
    end

  end

  binding.pry

  def self.house_list(house)
    response = RestClient.get(house.url)
    house_hash = JSON.parse(response.body, symbolize_names:true)
    house.gender = house_hash[:region]
    house.culture = house_hash[:coatOfArms]
    house.titles = house_hash[:titles]
    house.aliases = house_hash[:ancestralWeapons]
    binding.pry
  end
  
end