Rails.application.routes.draw do
  root 'items#index'

  resources :items

  resources :users, only: [:show, :create]
  get 'sign_up', to: 'users#new'

  get 'sign_in',   to: 'sessions#new'
  post 'signing',  to: 'sessions#create'
  get 'sign_out',  to: 'sessions#destroy'
end
