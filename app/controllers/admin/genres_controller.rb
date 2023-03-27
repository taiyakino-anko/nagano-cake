class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "商品を登録しました"
      redirect_to edit_admin_genre_path(@genre.id)
    else
      flash[:danger] = "必要情報を入力してください"
      render 'new'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render 'edit'
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:category)
  end

end
