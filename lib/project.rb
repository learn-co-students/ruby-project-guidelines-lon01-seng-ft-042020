class Project < ActiveRecord::Base
    belongs_to :user
    belongs_to :developer

  # helper method for create_new_project method
  # Set[] - data type represents a collcection of uniq elements
#   def self.available_languages
#     @languages = Set[]
#     # for each developer add developer language to Set[], add element to Set[]
#     Developer.all.each { |developer| @languages.add(developer.language) }
#     return @languages
#   end
  
#   def self.developer_options(developers)
#     @results = []
#     developers.each { |developer| @results.push("(ID: #{developer.id}) #{developer.name}")}
#     return @results
#   end
  
#   def self.developer_ids(developers)
#     @developer_ids = []
#     developers.each { |developer| @developer_ids.push("#{developer.id}")}
#     return @developer_ids
#   end
  
  # option no 1 - create new project
  def self.create_new_project
    puts "To get started, tell us your name:"
  # take a user name
    new_user_name = gets.chomp
  # out put all languages and question about the language
    new_app_language = User.prompt_user_for_input(info_string: "Thanks #{new_user_name}, you can write a project in any of the following languages:",
                                            print_options: Developer.available_languages(), prompt_string: "Enter the language you'd like your app to be built in:",
                                            invalid_string: "Language not recognized")
        
  # out put all available developers and ask for enter if of chosen developer
    available_developers = (Developer.all.select {|developer| developer.language == new_app_language})
    developer_id = User.prompt_user_for_input(info_string: "These are the available experts in #{new_app_language}:",
                                          print_options: Developer.developer_options(available_developers),set_options: Developer.developer_ids(available_developers),
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
  def self.available_projects
    @projects = Set[]
    Project.all.each { |project| @projects.add(project.name) }
    return @projects
  end
  
  def self.find_project_by_name
    project_name = User.prompt_user_for_input(info_string: "Please enter the name of your project. The available projects are:",
                                        print_options: self.available_projects(), prompt_string: "Enter the name of your app:", invalid_string: "Name not recognized")
    project = Project.find_by(name: project_name)                                
    # project = Project.all.select {|project| project.name == project_name}[0]
    return project
  end
  
  def self.available_categories
    @categories = Set[]
    Project.all.each { |project| @categories.add(project.category) }
    return @categories
  end
  
  def self.update_project_category(project)
    category = User.prompt_user_for_input(info_string: "Update the category of your app. Your choices are:",print_options: self.available_categories(), 
                                        prompt_string: "Enter the category of your app:", invalid_string: "Category not recognized")
    project.category = category
    project.save()
  end
  
  def self.read_project(project) # ??after change the directory stop working
    puts "Currenty the name of your app is #{project.name} with #{project.category} category, what is creating by #{self.read_developer_from_project(project)}.\n"
  end 
  
  def self.read_developer_from_project(project) #??after change directory stop working
    developer = Developer.find(project.developer_id)
    developer.name
  end
  
  # option no 2 - update project
  def self.update_project
    project = self.find_project_by_name()
    # self.read_project(project)
    self.update_project_category(project)
    puts "Project was successfully updated"
  end
  
  # option no 3 - delete project
  def self.delete_project
    project = find_project_by_name()
    project.destroy()
    puts "Project was successfully deleted"
  end

end