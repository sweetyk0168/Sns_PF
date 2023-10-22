class Public::CartTicketsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_tickets = current_customer.cart_tickets
  end

  def create
    @cart_ticket = CartTicket.new(cart_ticket_params)
    @cart_ticket.customer_id = current_customer.id
    @cart_ticket.save!
    redirect_to cart_tickets_path
  end

  private

  def cart_ticket_params
    params.require(:cart_ticket).permit(:amount, :event_ticket_id)
  end
end
