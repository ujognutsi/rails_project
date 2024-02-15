# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'up' => 'rails/health#show', as: :rails_health_check
  root 'main#welcome'
  get '/gallery', to: 'images#gallery'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  get 'users' => 'users#index'
  post '/change_language', to: 'application#change_language'
  resources :images, :users
end
