class Genre < ApplicationRecord
  has_many :books, dependent: :delete_all

  validates :title, presence: true
end
