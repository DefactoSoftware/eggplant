class PostsController < ApplicationController
  before_action :autenticate_user!

  def index
    Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:tweet, :planned_time)
  end

end
