Rails.application.routes.draw do
  root 'posts#index'

  resources :posts

  resources :users, only: [:show, :create]

  get 'sign_up',      to: 'users#new'
  get 'sign_in',      to: 'sessions#new'
  post 'new_session', to: 'sessions#create'
  get 'sign_out',     to: 'sessions#destroy'
end
