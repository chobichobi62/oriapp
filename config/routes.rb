Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get 'likes'
    end
  end

  resources :recipes do
    resource :favorite, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  post '/api/like/:id', to: 'recipes#like'
  root 'homes#index'
end