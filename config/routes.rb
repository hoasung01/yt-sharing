Rails.application.routes.draw do
  root 'visitors#index'
  resources :users, only: [:new, :create]
end
