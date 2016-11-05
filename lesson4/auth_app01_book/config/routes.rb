Rails.application.routes.draw do
  root 'session#new'

  resources :books

  resources :users, only: [:show, :create]

  get 'sign_up',  to: 'users#new'

  get 'sign_in',  to: 'sessions#new'
  post 'create',  to: 'sessions#create', as: :sessions
  get 'sign_out', to: 'sessions#destroy'
end
