Rails.application.routes.draw do
  root 'characters#index'

  resources :characters
end
