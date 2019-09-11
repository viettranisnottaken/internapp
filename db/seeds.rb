# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  name = Faker::Job.field
  Job.create(job_name: name)
end

99.times do |n|
  username  = Faker::Name.name
  email = "email-#{n+1}@internapp.com"
  password = "123456"
  age = 22
  phone = Faker::PhoneNumber.cell_phone_with_country_code
  address = Faker::Address.full_address
  User.create!(username:  username,
              email: email,
              password:              password,
              password_confirmation: password,
              age: age,
              phone_num: phone,
              address: address
            )
end
