class Admin::OrdersController < ApplicationController
  def show
    @order = Oder.find(order_params)
    @order_details = @order.order_details.all
  end
  
  private

  def order_params
    params.require(:order).permit(:address, :name, :delivery_cost, :order_status, :total_payment, :payment_method, :postal_code, :customer_id)
  end
  
  
end
