class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_header'
  def show
  end

  def edit
  end

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted, :validation)
  end
end
