class CLI

  def start
    
    puts "What information would you like to see?"
    puts "Please enter 'characters' if you would like characters: "
    puts "Please enter 'house' if you like to see the houses: "
    input = $stdin.gets.chomp
    if input = 'characters'    
      


  def greeting
    puts "Welcome to the Characters and Houses of Game of Thrones!"
    puts "What is your characters name so we can get started?"
    print '> '
      name = $stdin.gets.chomp
      puts "Welcome #{name} to House Targaryen of King's Landing!"
  end

  def characters
    puts 'Please pick a number to see characters information.'
    print '> '
    input = $stdin.gets.chomp
    API.create_characters
    list_characters
  end

  def list_characters
    Character.all.each.with_index(1) do | character, i |
        puts "#{i}. #{character.name}"
    end
  end

  def houses
    puts 'Please pick a number to see houses information:'
    print '> '
    input = $stdin.gets.chomp
    API.create_characters
    list_characters
  end
    
end