Rails.application.routes.draw do
  resources :users
  resources :outlets
  resources :merchandisers
  resources :managers
  resources :route_plans

  ## managers signup routes
  post '/signup', to: 'managers#create'

  ## merchandisers signup routes
  post '/merchandisers/signup', to: 'merchandisers#create'

  ## managers sessions routes
   post '/login', to: 'managers_sessions#login'
   delete '/logout', to: 'managers_sessions#destroy'
   get '/logged_in', to: 'managers_sessions#is_logged_in?'
 
   ## merchandisers sessions routes
   post '/login', to: 'merchandisers_sessions#create'
   delete '/logout', to: 'merchandisers_sessions#destroy'
   get '/logged_in', to: 'merchandisers_sessions#is_logged_in?'
   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
