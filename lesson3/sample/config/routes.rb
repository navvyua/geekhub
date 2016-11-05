Rails.application.routes.draw do
  resources :houses
  get 'hello_rails', to: 'hello#rails'
  resources :users
end
