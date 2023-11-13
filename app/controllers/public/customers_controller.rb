class Public::CustomersController < ApplicationController

  def new
   @custoomer = Customer.new
  end

  def show
    @customer = current_customer

    @customer = Customer.find(params[:id])
    # @following_customers = @customer.following_customers
    # @follower_customers = @customer.follower_customers
    #@post_images = @customer.post_images
  end

  def index
    @customers = Customer.all
    @customer = current_customer
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:notice] = "Customer Update successfully"
      redirect_to customers_path(@customer.id)
    else
      render 'edit'
    end
  end

  def confirm_withdraw
  end

 def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
 end

  #フォロー一覧
  # def follows
  #   customer = Customer.find(params[:id])
  #   @customers = customer.following_customers
  # end

  #フォロワー一覧
  # def followers
  #   customer = Customer.find(params[:id])
  #   @customer = customer.follower_customers
  # end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :profile_image, :customer_introduction, :postal_code, :address, :telephone_number)
  end
end
