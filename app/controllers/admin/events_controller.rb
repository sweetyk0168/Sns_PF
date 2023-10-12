class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_header'

  def new
    @event = Event.new
  end

  def index
    @events = Event.page(params[:page])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_events_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admin_event_path(@event)
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:genre_id, :name, :introduction, :post_status, :url_strings)
  end
end
