Rails.application.routes.draw do
  root 'vehicles#index'

  resources :vehicles
end
