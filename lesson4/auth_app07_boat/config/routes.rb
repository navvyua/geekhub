Rails.application.routes.draw do
  root 'boats#index'

  resources :boats

  resources :users, only: [:show, :create]
  get 'sign_up', to: 'users#new'

  get 'sign_in',     to: 'sessions#new'
  get 'sign_out',    to: 'sessions#destroy'
  post 'signing_in', to: 'sessions#create'
end
