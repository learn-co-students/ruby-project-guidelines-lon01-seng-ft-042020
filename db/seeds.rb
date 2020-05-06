require_relative '../config/environment'
require 'faker'


30.times do User.create(name: Faker::Name.unique.name)
end

60.times do Developer.create(name: Faker::Name.unique.name,  language: Faker::ProgrammingLanguage.name, email: Faker::Internet.email)
end

30.times do Project.create(name: Faker::App.name, category: Faker::Job.field, developer_id: Developer.all.sample.id, user_id: User.all.sample.id)
end

puts "Successfully Seeded."