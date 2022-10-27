Rails.application.routes.draw do
  resources :users
  resources :outlets
  resources :merchandisers
  resources :managers
  resources :route_plans

  ## managers signup routes
  post '/login', to: 'users#login'
  post '/signup', to: 'managers#create'
  post '/signup', to: 'merchandisers#create'


 
   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
