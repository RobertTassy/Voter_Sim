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
      puts "Sorry, wrong selcetion."
      puts ""
      create_what
    end
  end

  def create_politician
    puts "Name?"
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
    puts "Name?"
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
    puts "View registered (V)oters or (P)oliticians list?"
    list_choice = gets.chomp.capitalize.strip
    case list_choice
    when "V"
      puts "Registered voters: "
      # @voters.each do |voter|
      #   puts voter.voter_name + voter.voter_party
      # end
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
    puts "Update (V)oters or (P)oliticians list?"
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
  @voters.each do |voters|
    if voters.voter_name == voter_update
      puts "Update (N)ame or (P)arty?"
        name_or_party = gets.chomp.capitalize.strip
        if name_or_party == "N"
          puts "What is the updated name?"
            updated_name = gets.chomp.capitalize.strip
            voters.voter_name = updated_name
        elsif name_or_party == "P"
          puts "What is the updated party?"
            updated_party = gets.chomp.capitalize.strip
            voters.voter_party = updated_party
        else
          puts "Sorry, wrong selection. Rererouting..."
          update
        end
        main_menu
      end
    end
end

def update_politician
  puts "Which politician to update?"
  politician_update = gets.chomp.capitalize.strip
  @politicians.each do |politicians|
    if politicians.politician_name == politician_update
      puts "Update (N)ame or (P)arty?"
        name_or_party = gets.chomp.capitalize.strip
        if name_or_party == "N"
          puts "What is the updated name?"
            updated_name = gets.chomp.capitalize.strip
            politicians.politician_name = updated_name
        elsif name_or_party == "P"
          puts "What is the updated party?"
            updated_party = gets.chomp.capitalize.strip
            politicians.politician_party = updated_party
        else
          puts "Sorry, wrong selection. Rererouting..."
          update
        end
        main_menu
      end
    end
end

  def delete
    menu_option = @menu_option
    puts "Delete (V)oters or (P)oliticians list?"
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
