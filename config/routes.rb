Rails.application.routes.draw do
  resources :maps
  resources :data
  
  root 'maps#map'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
