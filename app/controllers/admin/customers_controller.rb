class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page params[:page]
  end

  def show
    @customer = Customer.find
  end

  def edit
    @customer = Customer.find
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(item_params)
      redirect_to admin_customer_path(@item)
    else
      render 'edit'
    end
  end
end
