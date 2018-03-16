require "./person.rb" 
require "./voter.rb" 
require "./politician.rb" 

class World 
    attr_accessor :voters, :politicians

    def initialize 
        @voters = []
        @politicians = []
    end

    def create_voter(name, politics)
        @voter = Voter.new(name, politics)
        @voters.push(@voter)
    end

    def create_politician(name, party) 
        @politician = Politician.new(name, party) 
        @politicians.push(@politician)
    end

    def list_politicians
        if @politicians.length == 0
            return "No politicians in our system"
        else
            result = ""
            @politicians.each do |p|
                result +=  "Politician, #{p.name}, #{p.party}"
            end
            result
        end
    end

    def list_voters
        if @voters.length == 0
            return "No voters in our system"
        else 
            result = ""
            @voters.each do |v|
                result += "Voter, #{v.name}, #{v.politics}"
            end
            result
        end
    end

    def update_politician(pol, category, replacement_val)
        person = nil 
        @politicians.each do |p| 
            if p.name == pol 
              person = p
            end  
        end

        if person.nil? 
            "This person is not in our system" 
        else
            case category 
            when "name" 
                person.name = replacement_val 
            when "party" 
                person.party = replacement_val
            end
        end
    end              

    def update_voter(v, category, replacement_val)
        person = nil 
        @voters.each do |p| 
            if p.name == v 
              person = p
            end  
        end

        if person.nil? 
            "This person is not in our system" 
        else
            case category 
            when "name" 
                person.name = replacement_val 
            when "politics" 
                person.politics = replacement_val
            end
        end
    end

    def delete_politician(name) 
        person = nil 
        @politicians.each do |p|
            if p.name == name 
               person = p
            end
        end

        if person.nil? 
            "There is no one to delete" 
        else
            @politicians.delete(person)
        end
    end


    def delete_voter(name) 
        person = nil 
        @voters.each do |v|
            if v.name == name 
               person = v
            end
        end

        if person.nil? 
            "There is no one to delete" 
        else
            @voters.delete(person)
        end
    end

    def test
        puts "Bitch I am Here from the WORLD"
    end
end