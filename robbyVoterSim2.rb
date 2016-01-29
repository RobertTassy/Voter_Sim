#WHOA!
#Added shit

class World

  def initialize
    @voters = []
    @politicians = []
  end

  def greet
    puts "Welcome to Robert's Voter Registry!"
    main_menu
  end

  def main_menu
    puts "What would you you like to do? Your options are:
    (C)reate, (L)ist, (U)pdate, or (D)elete"
    @menu_option = gets.chomp.upcase
    case @menu_option
    when "C"
      create
    when "L"
      list
    when "U"
      update
    when "D"
      delete
    else
      puts "Sorry, wrong selection"
      main_menu
    end
  end

  def create
    menu_option = @menu_option
    create_what
  end

  def create_what
    puts "What would you like to create? Your options are:
    (P)olitician or (V)oter"
    choice = gets.chomp.capitalize.strip
    case choice
    when "P"
      create_politician
    when "V"
      create_voter
    else
      puts "Sorry, wrong selection."
      puts ""
      create_what
    end
  end

  def create_politician
    puts "What is politician's name?"
    politician_name = gets.chomp.capitalize.strip
    puts "Which of the two parties for #{politician_name}:
    (D)emocract or (R)epublican"
    politician_party = gets.chomp.capitalize.strip
    case politician_party
    when "D"
      # p "Assigning #{politician_name} to Democratic party here"
      politician_party = "Democrat"
    when "R"
      # p "Assigning #{politician_name} to Republican party"
      politician_party = "Republican"
    else
      puts "Sorry, wrong selection. Rerouting..."
      create_politician
    end
    politician = Politician.new(politician_name, politician_party)
    @politicians << politician
    puts "#{politician_party} #{politician_name} has been added!"
    puts ""
    main_menu
  end



  def create_voter
    puts "What is voter's name?"
    voter_name = gets.chomp.capitalize.strip
    puts "Which of the four parties for #{voter_name}:
    (L)iberal, (C)onservative, (T)ea Party,(S)ocialist, or (N)eutral"
    voter_party = gets.chomp.capitalize.strip
    case voter_party
    when "L"
      # p "Assigning #{voter_name} to Liberal party"
      voter_party = "Liberal Party"
    when "C"
      # p "Assigning #{voter_name}to Conservative party"
      voter_party = "Conservative Party"
    when "T"
      # p "Assigning #{voter_name} to Tea party"
      voter_party = "Tea Party"
    when "S"
      # p "Assigning #{voter_name} to Socialist party"
      voter_party = "Socialist Party"
    when "N"
      # p "Assigning #{voter_name} to no party"
      voter_party = "No Party"
    else
      puts "Sorry, wrong selection. Rereouting..."
      create_voter
    end
    vote = Voter.new(voter_name, voter_party)
    @voters << vote
    puts "#{vote.voter_name} with #{vote.voter_party} has been added!"
    puts ""
    main_menu
  end


  def list
    menu_option = @menu_option
    puts "View registered (P)oliticians or (V)oters list?"
    list_choice = gets.chomp.capitalize.strip
    case list_choice
    when "V"
      puts "Registered voters: "
      puts @voters
      puts ""
      main_menu
    when "P"
      puts "Registered politicians: "
      puts @politicians
      puts ""
      main_menu
    else
      puts "Sorry, that selection does not exist."
      puts ""
      list
    end
    puts ""
    main_menu
  end

  def update
    menu_option = @menu_option
    puts "Update (P)oliticians or (V)oters list?"
    update_choice = gets.chomp.capitalize.strip
    # p "you've selected update!" if menu_option == "U"
    case update_choice
    when "V"
      update_voter
    when "P"
      update_politician
    else
      puts "Sorry, that selection does not exist."
      puts ""
      update
    end
    puts ""
  end

def update_voter
  puts "Which voter to update?"
  voter_update = gets.chomp.capitalize.strip
  @voters.each do |voter|
    if voter.voters_name == voter_update
      puts "Update (N)ame or (P)arty?"
      name_or_party = gets.chomp.capitalize.strip
        if name_or_party == "N"
          puts "What is the updated name?"
          updated_name = gets.chomp.capitalize.strip
          voter.voter_name = updated_name
          puts "Change to #{voter_update} was made."
        elsif name_or_party == "P"
          puts "What is the updated party?
          (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)o Party"
          updated_party = gets.chomp.capitalize.strip

          while !voter_valid_party?(updated_party)
            puts "Sorry, wrong selection. "
            updated_party = gets.chomp.capitalize.strip
          end

          voter.voter_party = !translate_party(updated_party)
          puts "Party change was made."
          puts ""
        else
          puts "Sorry, wrong selection. Rererouting..."
          puts ""
          update
        end
        main_menu
    else
      puts "Sorry but that selection does not exist."
      main_menu
    end
  end
end

def update_politician
  puts "Which politician to update?"
  politician_update = gets.chomp.capitalize.strip
  @politicians.each do |politician|
    if politician.politician_name == politician_update
      puts "Update (N)ame or (P)arty?"
      name_or_party = gets.chomp.capitalize.strip
        if name_or_party == "N"
          puts "What is the updated name?"
          updated_name = gets.chomp.capitalize.strip
          politician.politician_name = updated_name
          puts "Change to #{updated_name} was made."
        elsif name_or_party == "P"
          puts "What is the updated party? (R)epublican or (D)emocract? "
          updated_party = gets.chomp.capitalize.strip

          while !valid_party?(updated_party)
            puts "Sorry, wrong selection. (R)epublican or (D)emocract?"
            updated_party = gets.chomp.capitalize.strip
          end

          politician.politician_party = translate_party(updated_party)
          puts "Party change was made."
          puts ""
        else
          puts "Sorry, wrong selection. Rererouting..."
          puts ""
          update
        end
        main_menu
    else
      puts "Sorry but that selection does not exist."
      main_menu
    end
  end
end

def valid_party?(party_input)
  array = ['D', 'R']
  array.include? party_input
end

def voter_valid_party?(party_input)
  array = ['L', 'C', 'T', 'S', 'N']
  array.include? party_input
end

def translate_party(party_input)
  if party_input == "D"
    "Democrat"
  elsif party_input == "R"
    "Republican"
  end
end

def translate_party(party_input)
  if party_input == "L"
    "Liberal"
  elsif party_input == "C"
    "Conservative"
  elsif party_input == "T"
    "Tea Party"
  elsif party_input == "S"
    "Socialist"
  elsif party_input == "N"
    "No Party affiliation"
  end
end

  def delete
    menu_option = @menu_option
    puts "Delete (P)oliticians or (V)oters list?"
    delete_choice = gets.chomp.capitalize.strip
    case delete_choice
    when "V"
      puts "Delete whom?"
      name_deleting = gets.chomp.capitalize.strip
      @voters.delete_if do |voter|
        if voter.voter_name == name_deleting
          puts "Deleted"
          true
        else
          false
        end
      end
    when "P"
        puts "Delete whom?"
        name_deleting = gets.chomp.capitalize.strip
        @politicians.delete_if do |politician|
          if politician.politician_name == name_deleting
            puts "Deleted"
            true
          else
            false
          end
        end
        main_menu
    else
      puts "Sorry, that selection does not exist. Rerouting..."
      puts ""
      update
    end
    puts ""
    main_menu
  end
end



class Voter < World
  attr_accessor :voter_name, :voter_party
    def initialize(voter_name, voter_party)
      @voter_name = voter_name
      @voter_party = voter_party
    end

    def to_s
      @voter_name + " - " + @voter_party
    end

end

class Politician < World
  attr_accessor :politician_name, :politician_party
    def initialize(politician_name, politician_party)
      @politician_name = politician_name
      @politician_party = politician_party
    end

    def to_s
      @politician_name + " - " + @politician_party
    end

end

behold = World.new
behold.greet
