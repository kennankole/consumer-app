Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :categories, only: [:new, :create, :edit, :update, :destroy, :index]
  end

  get 'home/index'
  root to: 'home#index'
end

