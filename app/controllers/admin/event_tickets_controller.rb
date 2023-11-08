class Admin::EventTicketsController < ApplicationController
  layout 'admin_header'
  before_action :authenticate_admin!

  def new
    @eventticket = EventTicket.new
  end

  def create
    @eventticket = EventTicket.new(event_ticket_params)
    if @eventticket.save
      redirect_to admin_event_ticket_path(@eventticket)
    else
      render 'new'
    end
  end

  def index
    @eventtickets = EventTicket.page(params[:page]).per(10)
  end

  def show
    @eventticket = EventTicket.find(params[:id])
  end

  def edit
    @eventticket = EventTicket.find(params[:id])
  end

  def update
    @eventticket = EventTicket.find(params[:id])
    if @eventticket.update(event_ticket_params)
      redirect_to admin_event_ticket_path(@eventticket)
    else
      render 'edit'
    end
  end

  private

  def event_ticket_params
    params.require(:event_ticket).permit(:genre_id, :post_id, :event_id, :event_title, :ticket_startday, :ticket_endday, :ticket_place, :ticket_name, :ticket_introduction, :ticket_price, :sales_status, :performance_date )
  end
end
