class DashboardController < ApplicationController
  before_action :authenticate_user!
  def home
  end
  
  def index
    @user_details = current_user
  end

  def create_theme
    
  end
end
