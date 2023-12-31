class Public::RelationshipsController < ApplicationController
  #フォローする時
  def create
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end

  #フォロー外すとき
  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end
end
