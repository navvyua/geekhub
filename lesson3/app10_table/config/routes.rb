Rails.application.routes.draw do
  root 'tables#index'

  resources :tables
end
