# README

# ROUTES

  resources :users
  resources :outlets
  resources :merchandisers
  resources :managers
  resources :route_plans

  ## managers/merchandisers signup/login routes
  post '/login', to: 'users#login'
  post '/signup', to: 'managers#create'
  post '/signup', to: 'merchandisers#create'

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
