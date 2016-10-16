require_relative 'entry'

class AddressBook
    attr_reader :entries
    
    
    def initialize
        @entries = []
    end
    
    # add entry into AddressBook
    def add_entry(name, phone_number, email)
        # try to place entries in order by alphabet
        index = 0
        entries.each do |entry|
            if name < entry.name
                break
            end
            index += 1
        end
        # insert entry into array
        entries.insert(index, Entry.new(name, phone_number, email))
    end
    
    # remove entry from AddressBook
    def remove_entry(name, phone_number, email)
        # try to find match entry
        index = 0
        entries.each do |entry|
            if name == entry.name && phone_number==entry.phone_number && email == entry.email
                break
            end
            index += 1
        end
        # remove entry from array
        entries.delete_at(index)
    end
        
    
end