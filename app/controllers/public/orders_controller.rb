class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @order = Order.new(order_params)
    if parame[:order] [:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif parame[:order] [:address_option] == "1"
      ship = Address.find(params[:order] [:customer_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name
    elsif parame[:order] [:address_option] == "2"
      @order.postal_code = params[:order] [:postal_code]
      @order.address = params[:order] [:address]
      @order.name = params[:order] [:name]
    else
      render 'new'
    end
    @cart_items = current_customer.cart_ites.all
  end

  def create
  end

  def finish
  end

  def index
  end

  def show
  end


  private
  def order_params
    params.require(:order).permit(:delivery_cost, :payment_method, :first_name, :last_name, :address, :postal_code, :customer_id, :total_payment, :order_status)
  end
end
