Rails.application.routes.draw do
  root to: 'sessions#new'

  get  'sign_up', to: 'users#new'
  get  'sign_in', to: 'sessions#new'
  get  'log_out', to: 'sessions#destroy'
  post 'create',  to: 'sessions#create', as: :sessions

  resources :users, except: :new do
    resources :posts
    resource :profile, only: [:show, :edit, :update]
  end

  namespace :admin do
    resources :users, only: [:index, :update, :destroy]
    resources :posts, only: [:index, :destroy]
    resources :categories, except: :show
  end
end
