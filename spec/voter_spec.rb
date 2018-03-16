require "./person.rb"
require "./voter.rb"

describe Voter do

    it "is a Voter" do
        voter = Voter.new("John Doe", "neutral")
        expect(voter).to be_a(Voter)
    end

    it "can tell you its name" do
        voter = Voter.new("John Doe", "neutral")
        expect(voter.name).to eq("John Doe")
    end

    it "can report its politics" do 
        voter = Voter.new("John Doe", "neutral")
        expect(voter.politics).to eq("neutral")
    end
end