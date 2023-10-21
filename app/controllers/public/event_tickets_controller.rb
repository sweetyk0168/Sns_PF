class Public::EventTicketsController < ApplicationController
  def index
    @eventtickets = EventTicket.page(params[:page])
  end

  def show
    @eventticket = EventTicket.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
end