Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :videos, only: :index
  root 'sessions#visitor'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'
end
