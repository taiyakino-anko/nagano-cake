class Order < ApplicationRecord

  has_many :items, through: :order_details
  belongs_to :customer
end
