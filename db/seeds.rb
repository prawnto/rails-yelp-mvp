# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database"
Restaurant.destroy_all

puts "Creating restaurants"
category_arr = ["chinese", "italian", "japanese", "french", "belgian"]
10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: category_arr.sample,
    )
  5.times do
    review = Review.new(
      content: Faker::Restaurant.review,
      rating: rand(0..5)
    )
    review.restaurant = restaurant
    review.save!
  end
    restaurant.save!
  puts "Created #{restaurant.name}"
end
puts "Finished!"
