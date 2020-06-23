Rails.application.routes.draw do
  devise_for :users
  root to: 'shoes#index'
  resources :shoes do
    resource :comments, only: :create
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
