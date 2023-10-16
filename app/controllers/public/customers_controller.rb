class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer

    @customer = Customer.find(params[:id])
    @following_customers = @customer.following_customers
    @follower_customers = @customer.follower_customers
    #@post_images = @customer.post_images
  end

  def index
    @customers = Customer.all
    @customer = current_customer
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def edit
  end

  def confirm_withdraw
  end

  #フォロー一覧
  def follows
    customer = Customer.find(params[:id])
    @customers = customer.following_customers
  end

  #フォロワー一覧
  def followers
    customer = Customer.find(params[:id])
    @customer = customer.follower_customers
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
