class Public::GoodsController < ApplicationController
  def index
    @goods = Good.page(params[:page])
  end

  def show
    @good = Good.find(params[:id])
  end
end
