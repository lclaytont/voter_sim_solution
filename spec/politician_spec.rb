require "./person.rb" 
require "./politician.rb"

describe Politician do

    it "is a Politician" do
        politician = Politician.new("John Doe", "Democrat")
        expect(politician).to be_a(Politician)
    end

    it "reports its name" do 
        politician = Politician.new('John Doe', "Democrat")
        expect(politician.name).to eq('John Doe')
    end

    it "reports its political party" do
        politician = Politician.new("John Doe", "Democrat")
    end

end