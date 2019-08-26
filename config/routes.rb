Rails.application.routes.draw do
  resources :last_data
  resources :locations
  resources :data
  
  root 'maps#locations'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
