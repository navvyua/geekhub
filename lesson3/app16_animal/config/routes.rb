Rails.application.routes.draw do
  root 'animals#index'

  resources :animals
end
