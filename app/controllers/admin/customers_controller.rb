class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page params[:page]
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render 'edit'
    end
  end

    def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :address, :telephone_number, :is_deleted, :postal_code)
    end

end
