class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @orders = Order.all.page params[:page]
  end

  private

  def order_params
    params.require(:order).permit(:address, :name, :delivery_cost, :order_status, :total_payment, :payment_method, :postal_code, :customer_id)
  end

  
end

