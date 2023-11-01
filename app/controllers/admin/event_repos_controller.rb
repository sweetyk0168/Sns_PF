class Admin::EventReposController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_header'

  # def new
  #   @eventrepo = EventRepo.new
  # end

  # def create
  #   @eventrepo = EventRepo.new(event_repo_params)
  #   if @eventrepo.save!
  #     redirect_to admin_event_repos_path
  #   else
  #     render 'new'
  #   end
  # end

  def index
    @eventrepos = EventRepo.page(params[:page])
  end

  def edit
    @eventrepo = EventRepo.find(params[:id])
  end

  def update
    @eventrepo = EventRepo.find(params[:id])
    if @eventrepo.update(event_repo_params)
      redirect_to admin_event_repo_path(@eventrepo)
    else
      render 'edit'
    end
    if params[:event_repo][:image_ids]
      params[:event_repo][:image_ids].each do |image_id|
        image = @event_repo.images.find(image_id)
        image.purge
      end
    end
  end

  def show
    @eventrepo = EventRepo.find(params[:id])
  end

  private

  def event_repo_params
    params.require(:event_repo).permit(:event_repos_title, :event_repos_body, :genre_id, :post_status, images: [])
  end
end
