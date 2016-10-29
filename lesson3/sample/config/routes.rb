Rails.application.routes.draw do
  get 'hello_rails', to: 'hello#rails'
  resources :users
end
