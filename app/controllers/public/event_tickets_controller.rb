class Public::EventTicketsController < ApplicationController
  def index
    # # @event_tickets = EventTicket.page(params[:page])
    # @event = Event.find(params[:id])
    @event_tickets = EventTicket.page(params[:page]).per(10)
  end

  def show
    @event_ticket = EventTicket.find(params[:id])
    @cart_ticket = CartTicket.new
  end

  private
  def event_ticket_params
    params.require(:event_ticket).permit(:ticket_name, :introduction, :price, :sales_status, :image)
  end
end