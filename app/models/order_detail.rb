class OrderDetail < ApplicationRecord
  
  belongs_to :item
  belongs_to :order
  
  enum making_status: { cannot: 0, waiting: 1, making: 2, complete: 3 }
end
