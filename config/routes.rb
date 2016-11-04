Rails.application.routes.draw do
  resources :requests
  resources :schedules
  resources :positions
  resources :users
  resources :stores
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
