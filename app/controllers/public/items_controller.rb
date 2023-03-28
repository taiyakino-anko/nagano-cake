class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @items = Item.page(params[:page])
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :selling_status, :genre_id, :image)
  end
end
