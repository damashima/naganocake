class Item < ApplicationRecord
  has_many :cart_item
  has_many :order_details

  attachment :image

  def with_tax_price #消費税
    (price * 1.1).floor
  end
end
