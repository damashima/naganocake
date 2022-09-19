class Public::CartItemsController < ApplicationController
  def index
    @items = Item.all
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
