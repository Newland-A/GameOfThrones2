class CLI

  def start
    greeting
    puts "What information would you like to see?"
    puts "Please enter 'characters' if you would like characters: "
    puts "Please enter 'houses' if you like to see the houses: "
    print '> '
    input = $stdin.gets.chomp
    if input == 'characters' 
      #calls on characters method
      characters 
    elsif input == 'houses'
      #calls on house method
      houses
    else
      puts 'There is a hurdle in the road, please choose another path:'
      # calls on the list_characters method that iterates through the info
      list_characters
    end

  end
      
  def greeting
    puts "Welcome to the Characters and Houses of Game of Thrones!"
    puts "What is your name so we can get started?"
    #gets users input and interpolates the response
    print '> '
      name = $stdin.gets.chomp
      puts "Welcome #{name} to House Targaryen of King's Landing!"
  end

  def characters
    API.create_characters
    list_characters
    puts 'Please pick a number to see characters information.'
    puts 'Please enter: "number."'
    print '> '
    input = $stdin.gets.chomp
      if !input.to_i.between?(1, CHARACTERS.all.length)
        puts "HUM, that character doesn't seem to be here."
        puts "Please look for another character:"
        list_characters
        self
      else
        chars = CHARACTERS.all[input.to_i-1]
        API.character_list(chars)
        list_characters_details(chars)
        puts "Would you like to see another character?"
        puts "Please enter yes or no"
        print '> '
        input = $stdin.gets.chomp
          if input == 'yes'
            list_characters
            puts 'Please choose a number to continue:'
            print '> '
            input = $stdin.gets.chomp
                chars = CHARACTERS.all[input.to_i-1]
                API.character_list(chars)
                list_characters_details(chars)
                binding.pry true
                puts "Thank you for using my app, welcome to any feedback."
                puts "I hope you enjoyed it."
          else
            exit
          end
      end
  end

  def list_characters
    CHARACTERS.all.each.with_index(1) do | character, i |
        puts "#{i}. #{character.name}"
    end
  end

  def list_characters_details(chars)
    puts chars.gender
    puts chars.culture
    puts chars.born
    puts chars.titles
    puts chars.aliasesyes
  end

  def houses
    API.create_houses
    list_houses
    puts 'Please pick a number to see houses information:'
    print '> '
    input = $stdin.gets.chomp
    if !input.to_i.between?(1, HOUSES.all.length)
      puts "HUM, that house doesn't seem to be here."
      puts "Please look for another house:"
      list_houses
      self
    else
      house = HOUSES.all[input.to_i-1]
      list_houses
      puts "Would you liketo see another house?"
      puts "Please enter yes or no"
      print '> '
      input = $stdin.gets.chomp
      if input == 'yes'
        list_houses
      else
        exit
      end
    end
  end
    
  def list_houses
    HOUSE.all.each.with_index(1) do | realm, i |
        puts "#{i}. #{realm.name}"
    end
  end

  def list_house_details(chars)
    puts chars.gender
    puts chars.culture
    puts chars.born
    puts chars.titles
    puts chars.aliasesyes
  end
end