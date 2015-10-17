Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  # authenticated :user do
    # root to: 'orders#index', as: :authenticated_root
    resources :orders, only: [:new, :create, :index]
  # end

end
