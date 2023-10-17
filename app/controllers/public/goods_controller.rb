class Public::GoodsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @goods = Good.page(params[:page])
  end

  def show
    @good = Good.find(params[:id])
  end
end
