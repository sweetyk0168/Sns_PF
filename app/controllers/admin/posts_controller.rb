class Admin::PostsController < ApplicationController
  def destroy
    @post = Post.find(params[:id])
    @event = @post.event
    @post.destroy
    redirect_to admin_event_path(@event)
  end
end
