# name of the class
class Entry
    # define attributes for below method
    attr_accessor :name, :phone_number, :email
    # initialize the attribute 
    def initialize(name, phone_number, email)
        # create instance variables, and set attributes' values
        @name = name
        @phone_number = phone_number
        @email = email
    end
    
    def to_s
        "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
    end
end