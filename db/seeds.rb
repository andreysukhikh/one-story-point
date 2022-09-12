# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

10.times do
  Author.create!(fullname: FFaker::Book.unique.author)
end

20.times do
  Genre.create!(title: FFaker::Book.unique.genre)
end


Author.all.each do |author|
  rand(10..25).times do
    Book.create!(shelf: rand(1..15),
                 name: FFaker::Book.unique.title,
                 description: FFaker::Book.unique.description,
                 genre: Genre.find(rand(1..20)),
                 author: Author.find(rand(1..10)))
  end
end
