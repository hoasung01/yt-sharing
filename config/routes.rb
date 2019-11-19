Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]

  root 'sessions#visitor'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
