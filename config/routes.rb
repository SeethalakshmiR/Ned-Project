Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'reset_password', confirmation: 'verification', unlock: 'unblock', registration: '' }

  # login routes
  devise_scope :user do
    get '', to: 'devise/sessions#new', as: :login
    get '/logout', to: 'devise/sessions#destroy', as: :logout
    get '/forgot_username', to: 'users/sessions#forgot_username', as: :forgot_username
    post '/forgot_username', to: 'users/sessions#send_username', as: :send_username
  end 

  # create theme routes 
  get '/admin_dashboard/:token', to: 'dashboard#index', as: :admin_dashboard
  get '/create_theme', to: 'dashboard#create_theme', as: :create_theme
  post '/save_theme', to: 'dashboard#save_theme', as: :save_theme

  #show admin details routes
  get '/admin_list/:token', to: 'dashboard#show_admin_details', as: :admin_user
  get '/export_csv', to: 'dashboard#export_csv', as: :export_csv
end
