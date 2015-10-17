Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :orders, only: [:new, :create, :index, :show]
  resources :search, only: [:index]
end
