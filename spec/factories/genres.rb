FactoryBot.define do
  factory :genre do
    title { FFaker::Book.unique.genre }
  end
end
