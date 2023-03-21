Rails.application.routes.draw do
  # get 'categories/show'
  # get 'categories/index'
  # get 'categories/new'
  # get 'categories/create'
  # get 'categories/destroy'
  # get 'categories/edit'

  resources :users do
    resources :categories
  end

  get 'home/index'
  root to: 'home#index'
end

