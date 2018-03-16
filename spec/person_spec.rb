require "./person.rb"

describe Person do 

    it "should be an instance of person" do
        person = Person.new("John Doe") 
        expect(person).to be_a(Person)
    end

    it "should report its name" do 
        person = Person.new("John Doe")
        expect(person.name).to eq("John Doe")
    end
end