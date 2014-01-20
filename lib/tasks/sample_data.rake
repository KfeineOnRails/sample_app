namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "kfeine",
                 email: "kfeine@outlook.com",
                 password: "melissa",
                 password_confirmation: "melissa",
                 admin: true)
    1.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 2)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end