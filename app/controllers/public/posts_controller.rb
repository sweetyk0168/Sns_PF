class Public::PostsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    # @posts = Post.page(params[:page])
    @posts = Post.order(id: "DESC")
    @customer = current_customer
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :customer_id, :introduction, :image, event_ids: [])
  end

  def correct_customer
    @post = Post.find(params[:id])
    @customer = @post.customer
    redirect_to(posts_path) unless @customer == current_customer
  end
end
