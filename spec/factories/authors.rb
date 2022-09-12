FactoryBot.define do
  factory :author do
    fullname { FFaker::Book.unique.author }
  end
end
