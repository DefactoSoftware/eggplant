class TeamsController < ApplicationController
  before_filter :authorize
  before_action :correct_user, only: [:edit, :update, :destroy]

 def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.owner = current_user

    if @team.save!
      redirect_to team_path(@team)
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
    resource.update_attributes(team_params)
    redirect_to team_path(resource)
  end

  def destroy
    resource.destroy
    redirect_to teams_path
  end

  private

  def resource
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :description)
  end

  def correct_user
    @user = resource.owner
    unless @user == current_user
      redirect_to teams_path, notice: "Not authorized"
    end
  end
end
