
User.create( {username: 'Dan Pinto',
              email: 'fozzarelo@gmail.com',
              password: 'q',
              has_account: true,
              is_admin: true})

User.create( {username: 'Mistery Man',
              email: 'Q',
              password: 'q',
              has_account: true,
              is_admin: false})

10.times do

  User.create({ username: Faker::Name.name,
                email: Faker::Internet.email,
                password: 'pass',
                has_account: true,
                is_admin: false
    })

end

50.times do
  Contacting.create({ nickname: Faker::Name.first_name,
                      user_id: rand(7) + 1,
                      contact_id: rand(9) + 1
    })
end

80.times do
  Message.create({ address: Faker::Address.street_address, #=> "282 Kevin Brook"
                   user_id: rand(5) + 1,
                   target_email: Faker::Internet.email,
                   picture: Faker::Avatar.image
    })
end

puts "Seeded: 10 users, 50 contactings, 80 messages"
