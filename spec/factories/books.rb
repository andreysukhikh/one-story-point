FactoryBot.define do
  factory :book do
    shelf { rand(1..15) }
    name { FFaker::Book.unique.title }
    description { FFaker::Book.unique.description }
    genre_id { (FactoryBot.create :genre).id }
    author_id { (FactoryBot.create :author).id }
  end
end
