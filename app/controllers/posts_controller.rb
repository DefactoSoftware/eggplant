class PostsController < ApplicationController
  # auth?

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save!
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    resource
  end

  def edit
    resource
  end

  def update
    resource.update_attributes(post_params)
    redirect_to post_path(resource)
  end

  def destroy
    resource.destroy
    redirect_to posts_path
  end

  private

  def resource
    @post=Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:tweet, :planned_time)
  end

end
