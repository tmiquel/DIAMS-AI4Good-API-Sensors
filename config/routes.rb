# frozen_string_literal: true

Rails.application.routes.draw do
  resources :topics
  resources :users
  resources :data
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  root 'topics#welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
