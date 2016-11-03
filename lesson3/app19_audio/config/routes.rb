Rails.application.routes.draw do
  root 'audios#index'

  resources :audios
end
