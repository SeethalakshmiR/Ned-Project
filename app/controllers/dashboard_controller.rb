class DashboardController < ApplicationController
  before_action :authenticate_user!
  def home
  end
  
  def index
    @user_detail = current_user
    @app_details = Content.where(created_by_id: current_user.id)
  end

  def create_theme
    @app_details = Content.new
  end

  def save_theme
    @app_details = Content.create(content_params)
    redirect_to customer_dashboard_path
  end

  private
  def content_params
    params.require(:content).permit(:title, :alias, :introtext)
  end
end