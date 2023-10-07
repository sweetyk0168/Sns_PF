class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_header'

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
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
  end

  def edit
  end

  private

  def event_params
    params.require(:item).permit(:genre_id, :name, :introduction, :post_status)
  end
end
