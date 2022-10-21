Rails.application.routes.draw do
  resources :outlets
  resources :merchandisers
  resources :managers
  resources :route_plans
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
