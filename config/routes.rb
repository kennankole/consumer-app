Rails.application.routes.draw do
  get 'entities/show'
  get 'entities/index'
  get 'entities/new'
  get 'entities/create'
  get 'entities/destroy'
  devise_for :users
  resources :users do
    resources :categories, only: [:new, :create, :edit, :update, :destroy, :index]
  end

  get 'home/index'
  root to: 'home#index'
end

