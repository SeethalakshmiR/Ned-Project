class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def home
  end
  
  def index
  end

  def show_admin_details
    @admin_details = Dashboard.csv_file
  end

  def export_csv
    export_csv = Dashboard.csv_file
    send_data export_csv, filename: "app_admin_users_#{Date.today}.csv", type: 'csv/text'
  end
end
