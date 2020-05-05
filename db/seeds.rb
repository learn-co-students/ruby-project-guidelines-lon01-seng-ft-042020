require 'faker'

20.times do User.create(name: Faker::Name.unique.name)
end

20.times do Developer.create(name: Faker::Name.unique.name,  language: Faker::ProgrammingLanguage.name, email: Faker::Internet.email)
end

20.times do Project.create(name: Faker::App.name, category: Faker::Job.field, developer_id: Developer.all.sample.id, user_id: User.all.sample.id)
end

puts "Successfully Seeded."