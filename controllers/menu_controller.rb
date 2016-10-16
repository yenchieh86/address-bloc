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
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - EXIT"
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
                create_entry
                main_menu
            when 3
                system "clear"
                search_entries
                main_menu
            when 4
                system "clear"
                read_csv
                main_menu
            when 5
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
        
    end
        
    def read_csv
        
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
                
            # to edit the element
            when "e"
                
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
end