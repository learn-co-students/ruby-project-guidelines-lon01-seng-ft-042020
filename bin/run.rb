require_relative '../config/environment'
require 'set'

# cli.logo

puts "\n"  
puts " _|_|_|      _|_|_|_|  _|       _|   |            "
puts " _|    _|    _|        _|       _|                "
puts " _|     _|   _|         _|      _|    _|_|_|      "
puts " _|     _|   _|_|_|_|    _|    _|    _|    _|     "
puts " _|     _|   _|           _|  _|      _|_| _      "
puts " _|    _|    _|            _|_|           _|      "
puts " _|_|_|      _|_|_|_|       _|      _|_|_|     \n " 

# helper helper method for prompt_user_for_input method
# make priting a set more readable
def print_set_elements(set_elements)
  puts "\n#{set_elements.to_a.join(', ')}\n\n"
end

# info_string - welcome sentence, print_options - options for the User, set_options - valid input of User
def prompt_user_for_input(info_string:, print_options:, set_options:print_options, prompt_string:, invalid_string:)
  puts info_string
  print_set_elements(print_options)
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

# helper method for create_new_project method
# Set[] - data type represents a collcection of uniq elements
def available_languages
  @languages = Set[]
  # for each developer add developer language to Set[], add element to Set[]
  Developer.all.each { |developer| @languages.add(developer.language) }
  return @languages
end

def developer_options(developers)
  @results = []
  developers.each { |developer| @results.push("(ID: #{developer.id}) #{developer.name}")}
  return @results
end

def developer_ids(developers)
  @developer_ids = []
  developers.each { |developer| @developer_ids.push("#{developer.id}")}
  return @developer_ids
end

# option no 1 - create new project
def create_new_project
  puts "To get started, tell us your name:"
# take a user name
  new_user_name = gets.chomp
# out put all languages and question about the language
  new_app_language = prompt_user_for_input(info_string: "Thanks #{new_user_name}, you can write a project in any of the following languages:",
                                          print_options: available_languages(), prompt_string: "Enter the language you'd like your app to be built in:",
                                          invalid_string: "Language not recognized")
      
# out put all available developers and ask for enter if of chosen developer
  available_developers = (Developer.all.select {|developer| developer.language == new_app_language})
  developer_id = prompt_user_for_input(info_string: "These are the available experts in #{new_app_language}:",
                                        print_options: developer_options(available_developers),set_options: developer_ids(available_developers),
                                        prompt_string: "Enter the ID of the expert you'd like to work with:",invalid_string: "ID not recognized")
      
  developer = Developer.find(developer_id)

  puts "Congratulations, we've matched you with #{developer.name}, who is an expert in #{new_app_language}.\n"

# get the name of the new app to create a new project instance
  puts "If you'd like to start working with #{developer.name}, tell us the name of your new app:"
  new_app_name = gets.chomp

# create a new project instance
  project = Project.create(name: "#{new_app_name}")
  puts "Okay great, we've created a new project for you and #{developer.name} to start working on #{new_app_name}.\n"
  puts "HURRRRA!!! ALL SET! NOW JUST START ENJOY TO PROCCES BUIDING #{new_app_name}!"
  end

# helper methods for update_project method and delete_project method
def available_projects
  @projects = Set[]
  Project.all.each { |project| @projects.add(project.name) }
  return @projects
end

def find_project_by_name
  project_name = prompt_user_for_input(info_string: "Please enter the name of your project. The available projects are:",
                                      print_options: available_projects(), prompt_string: "Enter the name of your app:", invalid_string: "Name not recognized")
  project = Project.find_by(name: project_name)                                
  # project = Project.all.select {|project| project.name == project_name}[0]
  return project
end

def available_categories
  @categories = Set[]
  Project.all.each { |project| @categories.add(project.category) }
  return @categories
end

def update_project_category(project)
  category = prompt_user_for_input(info_string: "Update the category of your app. Your choices are:",print_options: available_categories(), 
                                  prompt_string: "Enter the category of your app:", invalid_string: "Category not recognized")
  project.category = category
  project.save()
end

def read_project(project)
  puts "Currenty the name of your app is #{project.name} with #{project.category} category, what is creating by #{read_developer_from_project(project)}.\n"
end 

def read_developer_from_project(project)
  developer = Developer.find(project.developer_id)
  developer.name
end

# option no 2 - update project
def update_project
  project = find_project_by_name()
  read_project(project)
  update_project_category(project)
  # read_project(project)
  puts "Project was successfully updated"
end

# option no 3 - delete project
def delete_project
  project = find_project_by_name()
  project.destroy()
  puts "Project was successfully deleted"
end

# start and good_bye methods
# convert array of string to set of string, every item is uniq
# prompt_user_for_input(info_string, print_options, set_options=print_options, prompt_string, invalid_string)
# set_option defined just in start method, other deafaul equal to set_options
def start
  puts "Welcome to DEV's, the tool that matches you with a developer to bring your App to life!\n"
  option = prompt_user_for_input(info_string:"Your available options are:", print_options: ["[1] Create a new project", "[2] Update an existing project", 
                                "[3] Delete a project", "[4] Exit"], set_options: ["1", "2", "3", "4"].to_s, 
                                prompt_string: "Choose an option from 1-4:",invalid_string: "Option not recognized")
  if option == "1"
    create_new_project()
  elsif option == "2"
    update_project()
  elsif option == "3"
    delete_project()
  elsif option == "4"
    return
  end
end
  
def good_bye
  puts "Bye! See you soon."
end 
  
start()
good_bye()