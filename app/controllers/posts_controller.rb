class PostsController < ApplicationController
  before_filter :authorize
  before_action :correct_user, only: [:edit, :update, :destroy]


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

  def tweet
    initialize_twitter_client.update(resource.tweet)
    redirect_to posts_path, notice: "tweet sent"
  end

  private

  def resource
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:tweet, :planned_time)
  end

  def correct_user
    @user = resource.user
    unless @user == current_user
      redirect_to posts_path, notice: "Not authorized"
    end
  end

  def initialize_twitter_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = resource.user.twitter_token
      config.access_token_secret = resource.user.twitter_secret
    end
  end
end
