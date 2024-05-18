Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get 'likes'
    end
  end

  resources :recipes do
    resources :favorites, only: [:create, :destroy] do
      member do
        post 'toggle'
      end
    end
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  root 'homes#index'
end
