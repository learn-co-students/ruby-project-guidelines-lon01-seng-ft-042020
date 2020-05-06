class Developer < ActiveRecord::Base
    has_many :projects
    has_many :users, through: :projects

    # helper method for create_new_project method
    # Set[] - data type represents a collcection of uniq elements
  def self.available_languages
    @languages = Set[]
    # for each developer add developer language to Set[], add element to Set[]
    Developer.all.each { |developer| @languages.add(developer.language) }
    return @languages
  end

  def self.developer_options(developers)
    @results = []
    developers.each { |developer| @results.push("(ID: #{developer.id}) #{developer.name}")}
    return @results
  end
  
  def self.developer_ids(developers)
    @developer_ids = []
    developers.each { |developer| @developer_ids.push("#{developer.id}")}
    return @developer_ids
  end

end