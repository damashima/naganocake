class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  def confirm
    @total = 0
    #@#total = @cart_items.inject(0) { |sum, |item|, |sum + item.sum_of_price }
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    @cart_items = current_customer.cart_items.all
  end

  def complete
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :addresses, :name, :shipping_cost, :total_payment, :payment_method)
  end
end
