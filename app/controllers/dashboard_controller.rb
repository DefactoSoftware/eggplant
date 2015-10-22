class DashboardController < ApplicationController
  def index
    @teams = current_user.teams
  end
end
