class Admin::OrdersController < ApplicationController
  def show
    @order = Oder.find(order_params)
  end
  
  private

  def order_params
    params.require(:order).permit(:address, :name, :delivery_cost, :order_status, :total_payment, :payment_method, :postal_code, :customer_id)
  end
  
  
end
