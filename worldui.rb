require "./world.rb"

# Interesting Comment

class WorldUi 

    def initialize 
        @world = World.new
    end

    def ui 
        opening_lines()
        action = gets.chomp

        case action.downcase
        when "c"
            voter_or_politician()
            person = gets.chomp 
            voter_politician_create(person)
        when "l"
            puts @world.list_politicians()
            puts @world.list_voters()
            restart()
        when "u"
            voter_or_politician_ud()
            entity = gets.chomp
            voter_politician_update(entity)
        when "d"
            ask_delete()
            person = gets.chomp
            voter_politician_delete(person)
        when "q"
            puts "Goodbye"
        else 
            restart()
        end
    end

    # Methods that trigger the script
    def opening_lines 
        puts "What would you like to do?"
        puts "(C)reate, (L)ist, (U)pdate, (D)elete, (Q)uit"
    end

    def voter_or_politician
        puts "What would you like to create?"
        puts "(P)olitician or (V)oter"
    end

    def voter_or_politician_ud
        puts "Whom would you like to update?"
        puts "(P)olitician or (V)oter"
    end

    def ask_politics
        puts "Politics?"
        puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
    end

    def ask_name
        puts "name?"
    end

    def ask_party
        puts "(D)emocrat or (R)epublican"
    end

    def update_who
        puts "Who would you like to update?"
    end 

    def ask_delete
        puts "Whom would you like to delete"
        puts "(P)olitician or (V)oter"
    end

    def confirm
        puts "Are you sure"
        puts "(Y)es or (N)o"
    end

    def new_value_pol(x) 
        puts "What would you like the new value to be?"
        case x.downcase
        when "name"
            val = gets.chomp 
            return val 
        when "party"
            ask_party()
            pick_party()
        else 
            restart()
        end
    end

    def new_value_voter(x) 
        puts "What would you like the new value to be?"
        case x.downcase
        when "name"
            val = gets.chomp 
            return val 
        when "politics"
            ask_politics()
            pick_politics()
        else 
            restart()
        end
    end

    def pick_politics
        politics = gets.chomp()
        case politics.downcase 
        when "l"
            return "Liberal"
        when "c"
            return "Conservative"
        when "t"
            return "Tea Party"
        when "s"
            return "Socialist"
        when "n"
            return "Neutral"
        else 
            restart()
        end
    end

    def pick_party
        party = gets.chomp
        case party.downcase
        when "d"
            return "Democrat"
        when "r"
            return "Republican"
        else
            restart()
        end
    end

    def update_what_category_voter
        puts "What would you like to update?"
        puts "(N)ame or (P)olitics"
        choice = gets.chomp
        case choice.downcase 
        when "n"
            return "name"
        when "p"
            return "politics"
        else 
            restart()
        end
    end
    
    def update_what_category_pol
        puts "What would you like to update?"
        puts "(N)ame or (P)arty"
        choice = gets.chomp
        case choice.downcase 
        when "n"
            return "name"
        when "p"
            return "party"
        else 
            restart()
        end
    end

    # Methods that call CRUD methods
    def voter_politician_create(person)
        case person.downcase
        when "v"
            ask_name()
            name = gets.chomp
            ask_politics()
            politics = pick_politics()
            @world.create_voter(name, politics)
            restart()
        when "p"
            ask_name()
            name = gets.chomp
            ask_party()
            party = pick_party() 
            @world.create_politician(name, party)
            restart()
        else 
            restart()
        end
    end

    def voter_politician_update(entity)
        case entity.downcase 
        when "v"
            ask_name()
            name = gets.chomp
            category = update_what_category_voter()
            val = new_value_voter(category)
            @world.update_voter(name, category, val)
            restart()
        when "p"
            ask_name()
            name = gets.chomp
            category = update_what_category_pol()
            val = new_value_pol(category)
            @world.update_politician(name, category, val)
            restart()
        else
            restart()
        end
    end

    def voter_politician_delete(person)
        case person.downcase 
        when "v"
            ask_name()
            name = gets.chomp
            confirm()
            confirmation = gets.chomp 
            if confirmation.downcase == "y" 
                @world.delete_voter(name)
            else
                restart()
            end
            restart()
        when "p"
            ask_name()
            name = gets.chomp
            confirm()
            confirmation = gets.chomp 
            if confirmation.downcase == "y" 
                @world.delete_politician(name)
            else
                restart()
            end
            restart()
        else 
            restart()
        end
    end

    def restart
        ui()
    end

end

world = WorldUi.new()
world.ui()