# access address_book file
require_relative '../models/address_book'

# the standard first line for RSpec test file, and access AddressBook class
RSpec.describe AddressBook do
    # use describe for test structure, and access to Entry's attrubutes
    describe "attributes" do
        
        # each 'it' represents a unique test
        # a test's start from 'it'
        it "responds to entries" do
            book = AddressBook.new
            # a test's end at 'expect'
            expect(book).to respond_to(:entries)
        # a command end at 'end'
        end
        
        it "initializes entries as an array" do
            book = AddressBook.new
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            book = AddressBook.new
            expect(book.entries.size).to eq(0)
        end
            
    end
    
    # test for adding entry into AddressBook
    describe "#add_entry" do
        # test add only one entry at a time
        it "adds only one entry to the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            
            expect(book.entries.size).to eq(1)
        end
        
        # make sure the entry has correct information
        it "adds the correct information to entries" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
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