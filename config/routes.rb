Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update]
  resources :creators, only: [ :index, :create, :show, :edit, :update ] do
    collection do
      post "new", to: "creators#new"
    end
    resources :upvotes, only: [:new, :create]
  end
resources :upvotes, only: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # /creators/45/upvotes
  # -> params 45 = creator_id

  # /upvotes/12 (delete)
  # Upvote.find(12).destroy




end

