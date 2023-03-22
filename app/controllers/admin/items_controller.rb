class Admin::ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    
  end

  def show
  end

  def edit
  end
  
  
  private

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :genre_id, :price, :selling_status)
  end
  
end


