# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(email: 'admin@example.com', password: '12345678')

10.times do
  Style.create(name: Faker::Lorem.word, description: Faker::Lorem.sentence)
end

5.times do
  Brewery.create(name: Faker::Lorem.sentence(2))
end

rand_id = Random.new

30.times do
 Beer.create(name: Faker::Lorem.word, brewery_id: rand_id.rand(1..5), style_id: rand_id.rand(1..10), 
  description: Faker::Lorem.sentence, rating: rand_id.rand(1..5))
end