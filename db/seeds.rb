# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'destroying all stories!'
Story.destroy_all

puts 'creating new stories!'

10.times do
  Story.create!(title: Faker::Hipster.word, content: Faker::Hipster.sentences(number: 1)[0])
end

puts "Created #{Story.count} stories"
