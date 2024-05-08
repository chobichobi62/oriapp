Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :recipes do
    resources :comments, only: :create
  end
  root 'homes#index'

end
