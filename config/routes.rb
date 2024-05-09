Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  root 'homes#index'

end
