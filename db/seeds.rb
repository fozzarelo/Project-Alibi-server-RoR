
10.times do

  User.create({ username: Faker::Name.name,
                email: Faker::Internet.email,
                password: 'pass',
                has_account: true,
                is_admin: false
    })

end

40.times do
  Contacting.create({ nickname: Faker::Superhero.name,
                      user_id: rand(5) + 1,
                      contact_id: rand(9) + 1
    })
end

puts "Seeded: 10 users and 60 contactings"
