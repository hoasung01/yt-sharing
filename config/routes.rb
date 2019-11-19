Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
  end

  root 'sessions#visitor'
end
