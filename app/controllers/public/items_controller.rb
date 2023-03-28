class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @items = Item.page(params[:page])
    @genres = Genre.all
    if params[:genre_id]
     @genre = Genre.find(params[:genre_id])
     @items = @genre.items.all
    end
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
