class Item < ApplicationRecord
  has_many :cart_item
  attachment :image

  def with_tax_price
    (price * 1.1).floor
  end
end
