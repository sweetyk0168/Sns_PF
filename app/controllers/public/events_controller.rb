class Public::EventsController < ApplicationController
  def index
    # @event = Event.find(params[:id])
    @events = Event.page(params[:page])
  end

  def show
  end

    def event_params
      params.require(:event).permit(:genre_id, :name, :introduction, :post_status)
    end
end
