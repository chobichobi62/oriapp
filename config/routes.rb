Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :users, only: [:show, :edit, :update]
  root 'homes#index'

end
