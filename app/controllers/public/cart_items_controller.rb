class Public::CartItemsController < ApplicationController
  #before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.sum(&:subtotal)
  end
  
  def update

  end
  def create
    #追加した商品がカート内に存在するかの判別
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      #存在した場合
      #カート内の個数をフォームから送られた個数分追加する
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
    else 
      @cart_item = CartItem.new
    end
  end
  
  def destroy

  end

  def destroy_all
    @cart_item = current_customer.cart_items.destroy_all
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
