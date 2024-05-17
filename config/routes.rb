Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get 'likes'
    end
  end

  resources :recipes do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  post 'favorites/toggle', to: 'favorites#toggle', as: :toggle_favorite

  root 'homes#index'
end
