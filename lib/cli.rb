class CLI

  def greeting
    puts "Welcome to the Characters and Houses of Game of Thrones!"
    puts "What is your characters name so we can get started?"
    print '> '
      name = $stdin.gets.chomp
      puts "Welcome #{name} to House Targaryen of King's Landing!"
  end
  
  # def list_characters
  #   #     #This gives all of the planets an index
  #   #     Planets.all.each.with_index(1) {| planet, i | puts "#{i}. #{planet.name}"}
  #   #   end
  #   #  #binding.pry 
    
end