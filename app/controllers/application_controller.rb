class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_team


  def authorize
    redirect_to root_path, alert: "Not authorized" if current_user.nil?
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_team
    @current_team ||= Team.find(params[:team_id])
  end
end
