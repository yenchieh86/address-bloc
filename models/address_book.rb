require_relative 'entry'

require "csv"

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
    
    # use 'File.read' to load information from file, and the file need to be in  CSV format
    # use 'csv' class to parse the file
    def import_from_csv(file_name)
        # implementation
        csv_text = File.read(file_name)
        # the variable 'csv' is a table type object
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
        
        # 
        csv.each do |row|
            # create a hash type variable 'row_hash'
            row_hash = row.to_hash
            # use 'add_entry' to change 'row_hash' into 'Entry', also add the new Entry into AddressBook's entries
            add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end
    end
    
    # the stub of binary_search
    # try to search AddressBook for specific entry by name
    def binary_search(name)
        # store the beginning and end of the array index into lower and upper variable
        lower = 0
        upper = entries.length - 1
        
        # use loop on entries from AddressBook
        while lower <= upper
            # put the middle element from array into mid_name
            mid = (lower + upper) / 2
            mid_name = entries[mid].name
            
            # comparing name (input) to mid_name (from array)
            if name == mid_name
                return entries[mid]
            elsif name < mid_name
                upper = mid - 1
            elsif name > mid_name
                lower = mid + 1
            end
        end
        
        # will return nil if didn't find any match
        return nil
    end
end