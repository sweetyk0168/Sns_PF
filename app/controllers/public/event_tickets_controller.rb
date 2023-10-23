class Public::EventTicketsController < ApplicationController
  def index
    @eventtickets = EventTicket.page(params[:page])
  end

  def show
    @eventticket = EventTicket.find(params[:id])
    @cart_ticket = CartTicket.new
  end

  private
  def event_ticket_params
    params.require(:event_ticket).permit(:genre_id, :ticket_name, :introduction, :price, :sales_status, :image)
  end
end