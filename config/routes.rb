Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :users
  root 'homes#index'

end
