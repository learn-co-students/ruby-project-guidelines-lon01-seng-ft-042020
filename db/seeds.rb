require 'faker'

def create_user_data
    10.times do User.create(name: Faker::Name.unique.name)
end

def create_developer_data
    10.times do Developer.create(name: Faker::Name.unique.name, age: Faker::Types.rb_integer,  language: Faker::ProgrammingLanguage.name, email: Faker::Internet.email)
end

def create_project_data
    10.times do Project.create(name: Faker::App.name, category: Faker::Job.field, developer_id: Developer.all.sample.id user_id: User.all.sample.id)
end

