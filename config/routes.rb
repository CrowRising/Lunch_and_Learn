# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  get '/api/v1/recipes', to: 'api/v1/recipes#index'
  get '/api/v1/learning_resources', to: 'api/v1/learning_resources#index'
  post '/api/v1/users', to: 'api/v1/users#create'
  post '/api/v1/sessions', to: 'api/v1/sessions#create'
  post '/api/v1/favorites', to: 'api/v1/favorites#create'
  get '/api/v1/favorites', to: 'api/v1/favorites#index'
end
