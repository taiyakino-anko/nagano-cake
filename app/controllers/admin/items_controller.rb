class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all.page params[:page]
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
      flash[:success] = "商品を登録しました"
    else
      flash[:danger] = "必要情報を入力してください"
      redirect_to  new_admin_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :genre_id, :price, :selling_status)
  end

end


