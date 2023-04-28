# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..15).each do |n|
  width =  5 + rand(10)
  height =  5 + rand(10)
  mines = 3 + rand( 10)
  puts "n: #{n} | width: #{width} | height: #{height} | mines: #{mines} |"
  Board.create!(name: "Mines #{n}", email: "user#{n}@mail.com", width: width, height: height, mines: mines)
end
