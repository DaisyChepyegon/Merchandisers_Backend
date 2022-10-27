Rails.application.routes.draw do
  resources :users
  resources :outlets
  resources :merchandisers
  resources :managers
  resources :route_plans

  ## managers signup routes
  post '/login-manager', to: 'users#login_manager'
  post '/login-merch', to: 'users#login_merch'
  post '/signup-manager', to: 'managers#create'
  post '/signup-merch', to: 'merchandisers#create'


 
   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
