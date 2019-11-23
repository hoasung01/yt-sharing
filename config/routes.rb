Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :videos, only: [:index, :create]

  root 'videos#index'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'
  get :share, to: 'videos#new'
end
