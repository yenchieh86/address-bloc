# access to address_book file
require_relative '../models/address_book'

# name of the class
class MenuController
    # define attribute for below method
    attr_reader :address_book
    
    # initialize the attribute
    def initialize
        # set attribute's value
        @address_book = AddressBook.new
    end
    
    def main_menu
        
        # display the main menu options on the command line
        puts "Main Menu - #{address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - View Entry Number n"
        puts "3 - Create an entry"
        puts "4 - Search for an entry"
        puts "5 - Import entries from a CSV"
        puts "6 - EXIT"
        puts "Enter your selection: "
        
        # use 'gets' to read user input from command line
        selection = gets.to_i
        
        # use case option to response to the user's input
        case selection
            when 1
                system "clear"
                view_all_entries
                main_menu
            when 2
                system "clear"
                view_entry_number_n
                main_menu
            when 3
                system "clear"
                create_entry
                main_menu
            when 4
                system "clear"
                search_entries
                main_menu
            when 5
                system "clear"
                read_csv
                main_menu
            when 6
                puts "Good-bye!"
                # use 'exit' to exit the program, and '0' shutdown the program without an error
                exit(0)
            # to catch any invalid input
            else
                system "clear"
                puts "Sorry, that is not a valid input."
                main_menu
            
        end
    end
        
    # set the rest of methods
    def view_all_entries
        # access to each of elements of entries from address_book
        address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s
            # call method 'entry_submenu' to display a submenu for each element
            entry_submenu(entry)
        end
        
        system "clear"
        puts "End of entries"
    end
        
    def view_entry_number_n
        print "Enter number: "
        # use ''.to_i' change string to int
        n = gets.chomp.to_i
        unless n < address_book.entries.count
            system "clear"
            puts "#{n} is not a valid input, please try again."
            view_entry_number_n
        else
        puts "#{address_book.entries[n - 1]}"
        end
    end
        
    def create_entry
        # clear screen and display new sentence
        system "clear"
        puts "New AddressBloc Entry"
        # to guide the user to enter each attribute
        print "Name: "
        # create variable to store each value (name, phone_number, email)
        # use '.chomp' to remove the \n or space from input
        name = gets.chomp
        print "Phone number: "
        phone_number = gets.chomp
        print "Email: "
        email = gets.chomp
        
        # add the inputs into address_book by using add_entry
        address_book.add_entry(name, phone_number, email)
        
        system "clear"
        puts "New entry created"
    end
        
    def search_entries
        # get the name that user want to search
        print "Search by name: "
        name = gets.chomp
        # will return a match or nil to 'match'
        match = address_book.binary_search(name)
        system "clear"
        # check if search has return a match
        # use 'search_submenu' to display a list of operation that can be performed on an Entry
        if match
            puts match.to_s
            search_submenu(match)
        else
            puts "No match found for #{name}"
        end
    end
        
    def search_submenu(entry)
        # print out the submenu for an entry
        puts "\nd - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        # save input to selection
        selection = gets.chomp
        
        #take action base on the input
        case selection
            when "d"
                system "clear"
                delete_entry(entry)
                main_menu
            when "e"
                edit_entry(entry)
                system "clear"
                main_menu
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                puts entry.to_s
                search_submenu(entry)
            
        end
    end
    
    def read_csv
        # get input from STDIN, and use '.chomp' to remove '\n' from input
        print "Enter CSV file to import: "
        file_name = gets.chomp
        
        # check if the file name is empty
        if file_name.empty?
            system "clear"
            puts "No CSV file read"
            main_menu
        end
        
        # import file, clear screen, print the number of entries that were read from file
        # begin and rescue will pretect the program from crashing
        # if everything goes well, will run begin command, if doesn't, will run rescue command
        begin
            entry_count = address_book.import_from_csv(file_name).count
            system "clear"
            puts "#{entry_count} new entries added from #{file_name}"
        rescue
            puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
            read_csv
        end
    end
    
    def entry_submenu(entry)
        # to display the submenu options
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        
        # necessary to use .chomp, because 'm ' and  'm\n' is not equal to 'm'
        selection = gets.chomp
        
        case selection
            # no need to set any command, the control will automatically return to 'view_all_entries'
            when "n"
                
            # to delete the element
            when "d"
                delete_entry(entry)
            # to edit the element
            when "e"
                deit_entry(entry)
                entry_submenu(entry)
            # return to main menu
            when "m"
                system "clear"
                main_menu
            # to catch any invalid input
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
            
        end
    end
    
    # remove entry from address_book
    def delete_entry(entry)
        address_book.entries.delete(entry)
        puts "#{entry.name} has been deleted"
    end

    def edit_entry(entry)
       # steps for letting user to input informations
       print "Updated name: "
       name = gets.chomp
       print "Updated phone number: "
       phone_number = gets.chomp
       print "Updated email: "
       email = gets.chomp
       # use '!attribute.empty?' to make sure a valid input was read
       entry.name = name if !name.empty?
       entry.phone_number = phone_number if !phone_number.empty?
       entry.email = email if !email.empty?
       system "clear"
       # print out the updated attributes
       puts "Updated entry: "
       puts entry
    end
end