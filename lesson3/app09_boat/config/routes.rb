Rails.application.routes.draw do
  root 'boats#index'

  resources :boats
end
