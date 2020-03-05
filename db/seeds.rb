# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

puts 'Creating 20 fake events...'
20.times do
  event = Event.new(
    user: User.find(1),
    title:    "#{Faker::Company.name}",
    location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    description: "#{Faker::Lorem.paragraph}",
    date:  Faker::Date.between_except(from: Date.today, to: 1.year.from_now, excepted: Date.today),
    speakers: "#{Faker::Name.name}",
    seats: "#{rand(20..100)}"
  )
  event.save!
end
puts 'Finished!'
