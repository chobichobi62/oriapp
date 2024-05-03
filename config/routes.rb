Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :new, :create]
  resources :users
  root 'homes#index'

end
