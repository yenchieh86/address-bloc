# access address_book file
require_relative '../models/address_book'

# the standard first line for RSpec test file, and access AddressBook class
RSpec.describe AddressBook do
    
    # create new instance 'book' and assign the AddressBook model to it
    let(:book) {AddressBook.new}
    
    # use describe for test structure, and access to Entry's attrubutes
    describe "attributes" do
        
        # each 'it' represents a unique test
        # a test's start from 'it'
        it "responds to entries" do
            # a test's end at 'expect'
            expect(book).to respond_to(:entries)
        # a command end at 'end'
        end
        
        it "initializes entries as an array" do
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
        end
            
    end
    
    # test for adding entry into AddressBook
    describe "#add_entry" do
        # test add only one entry at a time
        it "adds only one entry to the address book" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            
            expect(book.entries.size).to eq(1)
        end
        
        # make sure the entry has correct information
        it "adds the correct information to entries" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
    end
    
    # put this method into other method for make sure entry has the correct value
    def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eq expected_name
        expect(entry.phone_number).to eq expected_number
        expect(entry.email).to eq expected_email
    end
    
    # test to make sure AddressBook's ' .import_from_csv() ' method is working correctly
    describe "#import_from_csv" do
        it "imports the correct number of entries" do
            # call mathod 'import_from_csv' and pass the parameter to 'book' of AddressBook
            # 
            book.import_from_csv("entries.csv")
            book_size = book.entries.size
            # check the size of the entries in AddressBook
            expect(book_size).to eq 5
        end
        
        # access the first entry from array in AddressBook
        it "imports the 1st entry" do
            book.import_from_csv("entries.csv")
            # check the first entry
            entry_one = book.entries[0]
            # make sure the value is correct
            check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
        end
        
        it "imports the 2nd entry" do
            book.import_from_csv("entries.csv")
            entry_two = book.entries[1]
            check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
        end
        
        it "imports the 3rd entry" do
            book.import_from_csv("entries.csv")
            entry_three = book.entries[2]
            check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
        end
        
        it "imports the 4th entry" do
            book.import_from_csv("entries.csv")
            entry_four = book.entries[3]
            check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
        end
        
        it "imports the 5th entry" do
            book.import_from_csv("entries.csv")
            entry_five = book.entries[4]
            check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
        end
        
    end
    
    # test for removing entry from AddressBook
    describe '#remove_entry' do
        # find match entry
        it "removes match entry from the address book" do
            book = AddressBook.new
            entry_name = 'Ada Lovelace'
            entry_phone_number = '010.012.1815'
            entry_email = 'augusta.king@lovelace.com'
            book.remove_entry(entry_name, entry_phone_number, entry_email)
            expect(book.entries.size).to eq(0)
        end
    end
    
end