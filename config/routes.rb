Rails.application.routes.draw do
  # root to: "dashboard#index"
  get '/find_dashboard', to: 'dashboard#find_dashboard', as: :find_dashboard
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'reset_password', confirmation: 'verification', unlock: 'unblock', registration: '' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # login routes
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :logout
    get '/forgot_username', to: 'users/sessions#forgot_username', as: :forgot_username
    post '/forgot_username', to: 'users/sessions#send_username', as: :send_username
  end 
  # cretetheme routes 
  get '/admin_dashboard/:token', to: 'dashboard#index', as: :admin_dashboard
  get '/create_theme', to: 'dashboard#create_theme', as: :create_theme
  post '/save_theme', to: 'dashboard#save_theme', as: :save_theme
end
