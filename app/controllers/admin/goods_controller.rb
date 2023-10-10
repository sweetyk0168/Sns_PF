class Admin::GoodsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_header'

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      redirect_to admin_goods_path(@good)
    else
      render 'new'
    end
  end

  def index
    @goods = Good.page(params[:page])
  end

  def show
    @good = Good.find(params[:id])
  end

  def edit
    @good = Good.find(params[:id])
  end
  
  def update
    @good = Good.find(params[:id])
    if @good.update(good_params)
      redirect_to admin_good_path(@good)
    else
      render 'edit'
    end
  end

  private

  def good_params
    params.require(:good).permit(:genre_id, :name, :introduction, :post_status, :image)
  end
end
