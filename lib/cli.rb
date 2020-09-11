class CLI

  def start
    greeting
    puts "What information would you like to see?"
    puts "Please enter 'characters' if you would like characters: "
    puts "Please enter 'houses' if you like to see the houses: "
    print '> '
    input = $stdin.gets.chomp
    if input == 'characters' 
      characters 
    elsif input == 'houses'
      houses
    else
      puts 'There is a hurdle in the road, please choose another path:'
      list_characters
    end

  end
      
  def greeting
    puts "Welcome to the Characters and Houses of Game of Thrones!"
    puts "What is your characters name so we can get started?"
    print '> '
      name = $stdin.gets.chomp
      puts "Welcome #{name} to House Targaryen of King's Landing!"
  end

  def characters
    API.create_characters
    list_characters
    puts 'Please pick a number to see characters information.'
    print '> '
    input = $stdin.gets.chomp
      if !input.to_i.between?(1, CHARACTERS.all.length)
        puts "HUM, that character doesn't seem to be here."
        puts "Please look for another character:"
        list_characters
        self
      else
        chars = CHARACTERS.all[input.to_i-1]
        list_characters
        puts "Would you liketo see another character?"
        puts "Please enter yes or no"
        print '> '
        input = $stdin.gets.chomp
          if input == 'yes'
            list_characters
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

end