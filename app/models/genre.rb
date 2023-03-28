class Genre < ApplicationRecord
  has_many :orders

  validates :category, presence: true
end