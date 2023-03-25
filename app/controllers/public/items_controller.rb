class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page params[:page]
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :selling_status, :genre_id)
  end
end
