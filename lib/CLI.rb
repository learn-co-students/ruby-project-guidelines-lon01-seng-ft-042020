class Cli < ActiveRecord::Base

def self.logo
    puts "\n"  
    puts " _|_|_|      _|_|_|_|  _|       _|   |            "
    puts " _|    _|    _|        _|       _|                "
    puts " _|     _|   _|         _|      _|    _|_|_|      "
    puts " _|     _|   _|_|_|_|    _|    _|    _|    _|     "
    puts " _|     _|   _|           _|  _|      _|_| _      "
    puts " _|    _|    _|            _|_|           _|      "
    puts " _|_|_|      _|_|_|_|       _|      _|_|_|     \n "
end 

# start and good_bye methods
# convert array of string to set of string, every item is uniq
# prompt_user_for_input(info_string, print_options, set_options=print_options, prompt_string, invalid_string)
# set_option defined just in start method, other deafaul equal to set_options

def self.good_bye
    puts "Bye! See you soon."
end 

# start and good_bye methods
# convert array of string to set of string, every item is uniq
# prompt_user_for_input(info_string, print_options, set_options=print_options, prompt_string, invalid_string)
# set_option defined just in start method, other deafaul equal to set_options
def self.start
    puts "Welcome to DEV's, the tool that matches you with a developer to bring your App to life!\n"
    option = User.prompt_user_for_input(info_string:"Your available options are:", print_options: ["[1] Create a new project", "[2] Update an existing project", 
                                  "[3] Delete a project", "[4] Exit"], set_options: ["1", "2", "3", "4"].to_s, 
                                  prompt_string: "Choose an option from 1-4:",invalid_string: "Option not recognized")
    if option == "1"
      Project.create_new_project()
    elsif option == "2"
      Project.update_project()
    elsif option == "3"
      Project.delete_project()
    elsif option == "4"
      return
    end
  end
           
end