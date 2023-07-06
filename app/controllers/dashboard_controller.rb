class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user_detail = current_user
    @app_details = Content.where(created_by_id: current_user.id)
  end

  def create_theme
    @app_details = Content.new
  end

  def save_theme
    @app_details = Content.create(content_params)
    redirect_to admin_dashboard_path(token: current_user.token)
  end

  def show_admin_details
    @admin_details = Dashboard.get_admin_details
  end

  def export_csv
    export_csv = Dashboard.get_admin_details
    send_data export_csv, filename: "app_admin_users_#{Date.today}.csv", type: 'csv/text'
  end

  private
  
  def content_params
    params.require(:content).permit(:title, :alias, :introtext)
  end
end

