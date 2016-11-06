Rails.application.routes.draw do
  root 'shirts#index'

  resources :shirts

  resources :users, only: [:show, :create]
  get 'sign_up', to: 'users#new'

  get 'sign_in',   to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  get 'sign_out',  to: 'sessions#destroy'
end
