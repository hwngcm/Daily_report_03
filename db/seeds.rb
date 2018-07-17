2.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@email.com"
  password = "password"
  User.create!(name: name, email: email,
  position_id: 1, division_id: 1, password: password,
    password_confirmation: password)
end

3.times do |n|
  name  = Faker::Name.name
  email = "name-#{n+1}@email.com"
  password = "password"
  User.create!(name: name, email: email,
  position_id: 1, division_id: 2, password: password,
    password_confirmation: password)
end

2.times do |n|
  name  = Faker::Name.name
  email = "test-#{n+1}@email.com"
  password = "password"
  User.create!(name: name, email: email,
  position_id: 2, division_id: 1, password: password,
    password_confirmation: password)
end
