class Public::CustomersController < ApplicationController
  # マイページ
  def show
    @customer = Customer.find(params[:id])
  end
  # 会員情報編集
  def edit
  end
  # 退会確認
  def unsubscribe
  end
  # 退会処理（ステータス更新）
  def withdraw
  end
  # 会員情報の更新
  def update
  end
end
