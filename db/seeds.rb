=begin
10.times do

  User.create!(

    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
    )
  end
  users = User.all

50.times do

  Wiki.create!(

    user: users.sample,
    title: Faker::Hipster.word,
    body:  Faker::Lorem.paragraph(2),
    description:  Faker::Lorem.paragraph(2)
  )
  end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
=end 
