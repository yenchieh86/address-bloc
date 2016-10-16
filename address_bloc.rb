# access to menu_controller file
require_relative 'controllers/menu_controller'

# create a variable to store MenuController
menu = MenuController.new

# use this command to clear the command line
system "clear"

puts "Welcome to AddressBloc!"

# use '.main_menu' to display the menu
menu.main_menu