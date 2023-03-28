class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @addresses = @customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    # 現在memberに登録されている住所であれば
    if params[:order] [:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      # collection.selectであれば
    elsif params[:order] [:address_option] == "1"
      ship = Address.find(params[:order] [:customer_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name
      # 新規住所入力であれば
    elsif params[:order] [:address_option] == "2"
      @order.postal_code = params[:order] [:postal_code]
      @order.address = params[:order] [:address]
      @order.name = params[:order] [:name]
    else
      render 'new'
    end
    @cart_items = current_customer.cart_items
    @order.customer_id = current_customer.id
  end

  def create
    @order = Order.new(order_params)
    @order.save

    current_customer.cart_items.each do |cart_item| #カート内商品を1つずつ取り出しループ
      @ordered_item = OrderDetail.new #初期化宣言
      @ordered_item.order_id = @order.id #order注文idを紐付けておく
      @ordered_item.item_id = cart_item.item_id #カート内商品idを注文商品idに代入
      @ordered_item.amount = cart_item.amount #カート内商品の個数を注文商品の個数に代入
      @ordered_item.price = (cart_item.item.price*1.10).floor #消費税込みに計算して代入
      @ordered_item.save #注文商品を保存
    end  #ループ終わり


    current_customer.cart_items.destroy_all #カートの中身を削除

    redirect_to orders_finish_path

  end


  def finish
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @ordered_items = @order.order_details
  end


  private
  def order_params
    params.require(:order).permit(:delivery_cost, :payment_method, :name, :address, :postal_code, :customer_id, :total_payment, :order_status)
  end
end
