class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    #@post_images = @customer.post_images
  end

  def edit
  end

  def confirm_withdraw
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
