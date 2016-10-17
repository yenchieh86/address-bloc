# access entry file
require_relative '../models/entry'

# the standard first line for RSpec test file, and access Entry class
RSpec.describe Entry do
    # use describe for test structure, and access to Entry's attrubutes
    describe "attributes" do
        # create new instance 'entry' and assign an initialize data for the Entry to it
        let(:entry) { Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')}
        
        # each 'it' represents a unique test
        # a test's start from 'it'
        it "responds to name" do
            # a test's end at 'expect'
            expect(entry).to respond_to(:name)
        # a command end at 'end'
        end
        
        it "reports its name" do
            expect(entry.name).to eq('Ada Lovelace')
        end
        
        it "responds to phone number" do
            expect(entry).to respond_to(:phone_number)
        end
        
        it "reports its name" do
            expect(entry.phone_number).to eq('010.012.1815')
        end
        
        it "responds to email" do
            expect(entry).to respond_to(:email)
        end
        
        it "reports its name" do
            expect(entry.email).to eq('augusta.king@lovelace.com')
        end
    end
    
    describe "#to_s" do
        it "prints an entry as a string" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
            expect(entry.to_s).to eq (expected_string)
        end
    end
end