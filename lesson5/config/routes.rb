Rails.application.routes.draw do
  root to: 'sessions#new'

  get 'sign_up', to: 'users#new'
  get 'sign_in', to: 'sessions#new', as: :sign_in
  get 'log_out', to: 'sessions#destroy', as: :log_out
  post 'create', to: 'sessions#create', as: :sessions

  resources :users do
    resources :posts
    resource :profile, only: [:show, :edit, :update]
  end

  namespace :admin do
    resources :users
    resources :posts
  end
end
