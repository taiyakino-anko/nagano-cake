class Order < ApplicationRecord
  
  
  has_many :items, through: :order_details
  has_many :order_details
  belongs_to :customer

  enum order_status: { a: 0, b: 1, c: 2, d: 3, e: 4 }
  
  enum payment_method: { f: 0, g: 1 }

end
