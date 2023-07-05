Rails.application.routes.draw do
  root to: "dashboard#home"
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'reset_password', confirmation: 'verification', unlock: 'unblock', registration: '' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: 'logout'
    get '/forgot_username', to: 'users/sessions#forgot_username', as: :forgot_username
    post '/forgot_username', to: 'users/sessions#send_username', as: :send_username
  end  
  get '/customer', to: 'dashboard#index', as: :customer_dashboard
  get '/theme', to: 'dashboard#create_theme', as: :create_theme
  post '/create', to: 'dashboard#save_theme', as: :save_theme
end
