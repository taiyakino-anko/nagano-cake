class Admin::ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
      flash[:success] = "商品を登録しました"
    else
      render 'new'
      flash[:danger] = "必要情報を入力してください"
    end
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


