class Public::EventReposController < ApplicationController
  def index
    @eventrepos = EventRepo.page(params[:page])
    @quantity = EventRepo.count
  end

  def show
    @eventrepo = EventRepo.find(params[:id])
  end

   def event_repos_params
      params.require(:event_repos).permit(:genre_id, :event_repos_title, :event_repos_body, :post_status, :customer_id)
   end
end
