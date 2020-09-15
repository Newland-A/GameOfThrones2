class CLI

  def start
    greeting
    puts "What information would you like to see?"
    puts "Please enter 'characters' if you would like characters: "
    puts "Please enter 'houses' if you like to see the houses: "
    puts "Please type exit to leave the app!"
    #gets users input $stdin is for a linux system there is 3 of the $stdin $stdout and $stderr
    print '> '
    input = $stdin.gets.chomp.downcase
    # if input.start_with?('c').downcase
    if input.start_with?('c')
    # if input == 'characters'
      #calls on characters method
      characters 
    # elsif input == 'houses' 
    elsif input.start_with?('h') #refactered to prevent spelling typos
      #calls on house instance method
      houses
    elsif input == 'exit'
      exit
    else
      puts 'There is a hurdle in the road, please choose another path:'
      # calls on the list_characters instance method that iterates through the info
      characters
    end

  end
      
  def greeting
    puts "Welcome to the Characters and Houses of Game of Thrones!"
    puts "What is your name so we can get started?"
    #gets users input and interpolates the response
    print '> '
      name = $stdin.gets.chomp.capitalize
      puts "Welcome #{name} to House Targaryen of King's Landing!"
      puts "You can find information on the characters and their houses."
      puts "I hope your journey leads to the results your looking for."
      puts "Please type exit to leave the app!"
  end

  def characters
    #calls on the method in the API Class
    API.create_characters
    list_characters
    puts 'Please pick a number to see characters information.'
    puts 'Please enter: "number."'
    print '> '
    input = $stdin.gets.chomp
    #if the input is not between index zero and the end of the array
    #relists the array
      if !input.to_i.between?(1, CHARACTERS.all.length) #unless input == exit
        puts "HUM, that character doesn't seem to be here."
        puts "Please make a valid entry:"
        list_characters
        self #instance self
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
              # calls on the API class and inputs a argument of the index of the characters class
              API.character_list(chars)
              list_characters_details(chars)
# binding.pry true
              puts "Would you like to see Houses as well?"
              puts "Please enter yes or no:"
              print "> "
              input = $stdin.gets.chomp
                if input == 'yes'
                  houses
                elsif input == 'no'
                  puts "Thank you for using my app"
                  puts "Welcome to any feedback."
                  puts "Have a good day!"
                  exit
                else
                  start
                end
          end
      end
  end

  def list_characters
    CHARACTERS.all.each.with_index(1) do | character, i |
      sleep 0.3
      puts "#{i}. #{character.name}"
        
    end
  end

  def list_characters_details(chars)
    puts chars.gender
    puts chars.culture
    puts chars.born
    puts chars.titles
    puts chars.aliases
  end

  def houses
    API.create_houses
    list_houses
    puts 'Please pick a number to see houses information:'
    print '> '
    input = $stdin.gets.chomp.downcase
    if !input.to_i.between?(1, HOUSES.all.length)
      puts "HUM, that house doesn't seem to be here."
      puts "Please look for another house:"
      list_houses
      self #instance of self
    else
      house = HOUSES.all[input.to_i-1]
      API.house_list(house)
      list_house_details(house)
      # list_houses 'not needed for code but as reference
      puts "Would you like to see another house?"
      puts "Please enter yes or no"
      print '> '
      input = $stdin.gets.chomp.downcase
      if input == 'yes'
        list_houses
        puts 'Please choose a number to continue:'
        print '> '
        input = $stdin.gets.chomp.downcase
          house = HOUSES.all[input.to_i-1]
          API.house_list(house)
          list_house_details(house)
 # binding.pry #true was used to make sure it hit the pry before below code was added
          puts "Would you like to see characters as well?"
          puts "Please enter yes or no:"
          print "> "
            input = $stdin.gets.chomp.downcase
            if input == 'yes' 
              characters
            elsif input == 'no'
              puts "Thank you for using my app"
              puts "Welcome to any feedback."
              puts "Have a good day!"
              exit
            else
              exit
            end
      end
    end
  end
    
  def list_houses
    HOUSES.all.each.with_index(1) do | realm, i |
      #pauses program for 5 seconds
      sleep 0.3
      puts "#{i}. #{realm.name}"
    end
  end

  def list_house_details(house)
    puts house.region 
    puts house.coat_of_arms
    puts house.titles
    puts house.ancestral_weapons
  end

end

#what would be need to help refactor so the details have index numbers as well.???
# def list_house_details
#   API.house_list.each.with_index(1) do | house, i |
#     puts "#{i}. #{house.name}"
#   end
# end