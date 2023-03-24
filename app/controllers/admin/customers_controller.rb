class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find
  end

  def edit
    @customer = Customer.find
  end
  
  def update
    
  end
end
