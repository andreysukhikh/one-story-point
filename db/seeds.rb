AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

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
