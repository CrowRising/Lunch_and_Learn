# frozen_string_literal: true

Rails.application.routes.draw do
 get '/api/v1/recipes', to: 'api/v1/recipes#index'
 get '/api/v1/air_quality', to: 'api/v1/air_quality#index'
end
