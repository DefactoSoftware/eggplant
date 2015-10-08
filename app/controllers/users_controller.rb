class UsersController < ApplicationController
  before_filter :authorize
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    resource.update_attributes(user_params)
    redirect_to user_path(resource)
  end

  private

  def resource
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to users_path, notice: "Not authorized"
    end
  end
end
