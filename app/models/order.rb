class Order < ApplicationRecord


  has_many :items, through: :order_details
  has_many :order_details
  belongs_to :customer

  enum order_status: { waiting: 0, confirm: 1, making: 2, preparation: 3, sent: 4 }

  enum payment_method: { credit: 0, bank: 1 }



end
