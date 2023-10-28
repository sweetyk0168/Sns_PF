class Public::PostsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    #byebug
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
    @post_comments = PostComment.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments
    @post_comment = @post.post_comments.build
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :customer_id, :introduction, :image, :post_comment, :event_id)
  end

  def correct_customer
    @post = Post.find(params[:id])
    @customer = @post.customer
    redirect_to(posts_path) unless @customer == current_customer
  end
end
