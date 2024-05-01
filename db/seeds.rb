# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

20.times do |n|
  Author.create!(
    name: Faker::Name.unique.name,
  )
end

20.times do |n|
  Painting.create!(
    name: Faker::Name.unique.name,
    author_id: 1,
  )
end

