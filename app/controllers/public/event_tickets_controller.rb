class Public::EventTicketsController < ApplicationController
  def index
    @eventtickets = EventTicket.page(params[:page])
  end

  def show
    @eventticket = EventTicket.find(params[:id])
    @cart_ticket = CartTicket.new
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :ticket_name, :introduction, :price, :sales_status, :image, :event_id)
  end
end