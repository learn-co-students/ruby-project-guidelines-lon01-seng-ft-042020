require "pry"
class Application

    attr_reader :prompt

    
    def initialize()
        @prompt = TTY::Prompt.new
    end

    def user_input
        gets.chomp
    end

    def welcome
        puts "Hello! Welcome to the app"
        choice = self.prompt.select("Are you a New user or Returning user?") do |menu|
            menu.choice "New User", ->{new_user}
            menu.choice "Returning User", ->{returning_user}

            
            # something here?
        end
    end

    def main_menu
        
        puts "My Bookings"
        puts "Manage bookings"
        puts "Search Bookings"
        puts "Exit"
        # system "clear"
        # puts "Hello, #{self.user.name}!"
        # puts ""
        # choice = self.prompt.select("Welcome! Please select one of the following:") do |menu|
        #     # create a booking?
        #     menu.choice "My Bookings", -> {self.user.Booking}
        #     menu.choice "Manage Bookings", -> {self.user.manage_account}
        #     menu.choice "Search Bookings", -> {self.search}
        #     menu.choice "Exit", -> {Interface.exit_app}
        # end
    end


    def new_user
        puts "What is your name?"
        # reply = self.tty_prompt.ask("What is your name? (Please enter your name)")
        reply = user_input
        main_menu
        # User.create(name: reply)

        
    end

    def returning_user
        puts "Please enter your name"
        reply = user_input
        User.all.find{|user| user.name == reply}
    end

        



        
        
        
        # please enter your name
        # user input



    # Login_menu
    # main_menu
        # Create new booking
        # View current bookings
            # cancel booking
            # amend booking
            # back to main menu
        # Quit
            # Are you sure you want to quit? Y/N



end