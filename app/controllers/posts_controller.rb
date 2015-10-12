class PostsController < ApplicationController
  before_filter :authorize
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @team = Team.find(params[:team_id])
    @posts = @team.posts
  end

  def new
    @team = Team.find(params[:team_id])
    @post = @team.posts.new
  end

  def create
    @team = Team.find(params[:team_id])
    @post = @team.posts.new(post_params)
    @post.user = current_user

    if @post.save!
      redirect_to team_post_path(@post.team, @post)
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
    redirect_to team_post_path(resource.team, resource)
  end

  def destroy
    resource.destroy
    redirect_to team_posts_path
  end

  def tweet
    initialize_twitter_client.update(resource.tweet)
    redirect_to team_posts_path, notice: "tweet sent"
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
      redirect_to team_posts_path, notice: "Not authorized"
    end
  end

  def initialize_twitter_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = resource.team.owner.twitter_token
      config.access_token_secret = resource.team.owner.twitter_secret
    end
  end
end
