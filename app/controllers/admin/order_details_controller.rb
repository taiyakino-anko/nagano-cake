class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail= OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:price, :amount, :making_status, :order_id, :item_id)
  end

end
