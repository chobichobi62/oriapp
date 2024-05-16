Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index,:show, :edit, :update] do
    collection do
    end
  end

  resources :recipes do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  root 'homes#index'
  get 'users/:id/likes', to: 'users#likes', as: 'likes_user'

end
