class API

  def self.create_characters #class method
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
   #binding.pry true #you use true to help make sure it hits the pry when there is no code after the pry.
    end
  #binding.pry
  end

  #binding.pry

  def self.character_list(character) #class method with an argument

    response = RestClient.get(character.url)
    char_hash = JSON.parse(response.body, symbolize_names:true)
    # binding.pry
    character.gender = char_hash[:gender]
    character.culture = char_hash[:culture]
    character.born = char_hash[:born]
    character.titles = char_hash[:titles]
    character.aliases = char_hash[:aliases]
   # binding.pry
  end
 
  def self.create_houses
  #goes out and gets the information from the API                    # limits the amount of output
    response = RestClient.get('https://anapioficeandfire.com/api/houses?pageSize=25')
  #returns that information in a parsed hash, symbolize turns all the keys a different color for easier readability
    house_hash = JSON.parse(response.body, symbolize_names:true)
  
  #then iterates through the hash and returns the elements

  #ref 3
    house_hash.each do |realm|
      #sets the arguments of the attributes to a var
      url = realm[:url]
      name = realm[:name]
      #passes the var on the HOUSES class to create a new instance
      HOUSES.new(name, url)
    end
#binding.pry
  end

  #binding.pry

  def self.house_list(house)
    response = RestClient.get(house.url)
    house_hash = JSON.parse(response.body, symbolize_names:true)
    house.region = house_hash[:region]
    house.coat_of_arms = house_hash[:coatOfArms]
    house.titles = house_hash[:titles]
    house.ancestral_weapons = house_hash[:ancestralWeapons]
   # binding.pry
  end
  
end

#may be used for refactor later on
# character.name = char_hash[:name]

#selects the main key in the hash
    # house_array = house_hash[:name] #used at the beginning of the code to help iterate each attribute til it was no longer needed.

#possible way to refactor the house_list to out put numbers as well

#Maybe I need a class for the details as well instead of calling on the Houses class

# house_hash.each do |realm|
#   coat_of_arms  = realm[:coatOfArms]
#   titles  = realm[:titles]
#   ancestral_weapons  = realm[:ancestralWeapons]
#   HOUSES.new(coat_of_arms, titles, ancestral_weapons)
# # end


# reference 3
#it does not like the collect key word, Try to find a fix in the morning after a break.
# house_hash.each do |realm|
