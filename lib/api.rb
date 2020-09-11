class API

  def self.create_characters
    response = RestClient.get('https://anapioficeandfire.com/api/characters/583')
    got_hash = JSON.parse(response.body, symbolize_names:true)
    char_array = got_hash[:name]

    got_characters = char_array.collect do | person |
      CLI.new(person)
    end
  binding.pry
  end

  def self.character_list(character)
    response = RestClient.get(character.url)
    char_hash = JSON.parse(response.body, symbolize_names:true)
    character.gender = char_hash[:gender]
    character.culture = char_hash[:culture]
    character.born = char_hash[:born]
    character.titles = char_hash[:titles]
    character.aliases = char_hash[:titles][:aliases]
  end
  binding.pry
end