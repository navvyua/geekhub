Rails.application.routes.draw do
  root 'characters#index'

  resources :characters

  resources :users, only: [:show, :create]

  get 'sign_up',  to: 'users#new'
  get 'sign_in',  to: 'sessions#new'
  post 'create',  to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'
end
