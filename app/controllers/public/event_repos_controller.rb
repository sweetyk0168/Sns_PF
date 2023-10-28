class Public::EventReposController < ApplicationController
  def index
    @eventrepos = EventRepo.page(params[:page])
    @quantity = EventRepo.count
  end

  def show
    @eventrepo = EventRepo.find(params[:id])
  end
end
