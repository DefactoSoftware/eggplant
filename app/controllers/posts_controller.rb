class PostsController < ApplicationController
  before_filter :authorize
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :only_authorize_team_members

  def index
    @posts = Post.where team: current_team
  end

  def new
    @post = Post.new(user: current_user, team: current_team)
  end

  def create
    @post = current_team.posts.new(post_params)
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
    @post ||= Post.find(params[:id])
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

  def only_authorize_team_members
    unless current_team.users.include?(current_user)
      redirect_to teams_path, notice: "Not authorized"
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
