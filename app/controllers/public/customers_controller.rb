class Public::CustomersController < ApplicationController
  # マイページ
  def show
    @customer = current_customer
  end
  # 会員情報編集
  def edit
    @customer = current_customer
     unless @customer == current_customer
      redirect_to  customer_path(@customer.id)
     end
  end
  # 会員情報の更新
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end
  # 退会確認
  def unsubscribe
  end
  # 退会処理（ステータス更新）
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
