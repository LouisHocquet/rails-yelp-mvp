# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "<<< Cleaning Restaurant DB >>>"
Restaurant.destroy_all
puts "<<< Adding fake restaurants >>>"

categories = ["chinese", "italian", "japanese", "french", "belgian"]

5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    category: categories.sample,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164
  )
  restaurant.save
  review = Review.new(content: "good review", rating: 5, restaurant_id: restaurant.id)
  review2 = Review.new(content: "bad review", rating: 2, restaurant_id: restaurant.id)
  review.save
  review2.save
end

puts "<<< Added #{Restaurant.count} fake restaurants >>>"