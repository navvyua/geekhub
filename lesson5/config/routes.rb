Rails.application.routes.draw do
  root 'sessions#new'

  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  get  'signup', to: 'users#new'

  resources :users, except: :new do
    resources :posts
  end
end
