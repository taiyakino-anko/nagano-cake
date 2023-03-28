class Genre < ApplicationRecord
  has_many :orders
  has_many :items

  validates :category, presence: true
end