class User < ActiveRecord::Base
    has_many :projects
    has_many :developers, through: :projects

# helper helper method for prompt_user_for_input method
# make priting a set more readable
def self.print_set_elements(set_elements)
    puts "\n#{set_elements.to_a.join(', ')}\n\n"
end

# info_string - welcome sentence, print_options - options for the User, set_options - valid input of User
def self.prompt_user_for_input(info_string:, print_options:, set_options:print_options, prompt_string:, invalid_string:)
  puts info_string
  self.print_set_elements(print_options)
  # keep looping until unser enter valid input
  while true
    puts prompt_string
    user_input = gets.chomp
    if set_options.include? "#{user_input}"
      puts " "
      return user_input
    end
    puts "#{invalid_string}\n\n"
  end
end

end