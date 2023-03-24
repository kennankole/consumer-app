Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :categories, only: [:new, :create, :edit, :update, :destroy, :index] do
      resources :entities, only: [:new, :create, :index]
    end
    # resources :entities, only: [:new, :create, :index]
  end

  get 'home/index'
  root to: 'home#index'
end
