require "./world.rb"

describe World do 
    it "is an instance of World" do 
        world = World.new()
        expect(world).to be_a(World)
    end

    it "can create a voter" do
        world = World.new() 
        world.create_voter("John Doe", "neutral")
        expect(world.voters.count).to eq(1)
    end

    it "can create a politician" do
        world = World.new() 
        world.create_politician("John Doe", "Democrat")
        expect(world.politicians.count).to eq(1)
    end

    it "can list a politician" do
        world = World.new() 
        world.create_politician("John Doe", "Democrat")
        expect(world.list_politicians).to eq("Politician, John Doe, Democrat")
    end

    it "can list a voter" do 
        world = World.new() 
        world.create_voter("John Doe", "Neutral")
        expect(world.list_voters).to eq("Voter, John Doe, Neutral") 
    end

    it "can update a politician record by name" do
        world = World.new() 
        world.create_politician("John Doe", "Democrat")
        world.update_politician("John Doe", "name", "Johannes Doe")
        expect(world.list_politicians).to eq("Politician, Johannes Doe, Democrat")
    end

    it "can update a politician record by party" do
        world = World.new() 
        world.create_politician("John Doe", "Democrat")
        world.update_politician("John Doe", "party", "Republican")
        expect(world.list_politicians).to eq("Politician, John Doe, Republican")
    end

    it "can update a voter record by name" do
        world = World.new() 
        world.create_voter("John Doe", "Neutral")
        world.update_voter("John Doe", "name", "Jane Doe")
        expect(world.list_voters).to eq("Voter, Jane Doe, Neutral")
    end

    it "can update a voter record by politics" do
        world = World.new() 
        world.create_voter("John Doe", "Neutral")
        world.update_voter("John Doe", "politics", "Socialist")
        expect(world.list_voters).to eq("Voter, John Doe, Socialist")
    end

    it "can delete a politician" do
        world = World.new() 
        world.create_politician("John Doe", "Democrat") 
        world.delete_politician("John Doe")
        expect(world.politicians.length).to eq(0)
    end

    it "can delete a voter" do
        world = World.new() 
        world.create_voter("John Doe", "Neutral") 
        world.delete_voter("John Doe")
        expect(world.voters.length).to eq(0)
    end
end