class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @total = 0
    #@#total = @cart_items.inject(0) { |sum, |item|, |sum + item.sum_of_price }
    @order = Order.new(order_params)
    #  [:address_option]=="0"のデータ(memberの住所)を呼び出す
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    # [:address_option]=="1"を呼び出す
    elsif params[:order][:address_option] == "1"
      address = Address.find(params[:order][:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name

    # 新規住所入力 [:address_option]=="2"としてデータをhtmlから受ける
    elsif params[:order][:address_option] = "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render 'new'
    end

    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
     @order_detail = OrderDetail.new #初期化宣言
     @order_detail.item_id = cart_item.item.id #商品idを注文商品idに代入
     @order_detail.amount = cart_item.amount #商品の個数を注文商品の個数に代入
     @order_detail.price = (cart_item.item.price*1.08).floor #消費税込みに計算して代入
     @order_detail.order_id =  @order.id #注文商品に注文idを紐付け
     @order_detail.save #注文商品を保存
    end #ループ終わり
    current_customer.cart_items.destroy_all #カートの中身を削除
      redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end
end
