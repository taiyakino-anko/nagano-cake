class Item < ApplicationRecord
  has_one_attached :image
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items
  belongs_to :genre

  validates :name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "半角数字のみが許可されています" }

  enum selling_status: { sell: 0, sold_out: 1 }
end
