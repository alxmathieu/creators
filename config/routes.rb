Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :users

  scope '(:locale)', locale: /en/ do
    root to: 'pages#home'
    get :about, to: "pages#about"
    get :cgu, to: "pages#cgu"
    get :creators, to: "creators#index", as: :search
    resources :users, only: [:show, :edit, :update]
    resources :creators, only: [:show, :edit, :update ] do
      collection do
        post "new", to: "creators#new"
        post "create", to: "creators#create", as: :create
      end
      resources :upvotes, only: [:new, :create, :destroy]

    end
  end


# resources :upvotes, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # /creators/45/upvotes
  # -> params 45 = creator_id
  # /upvotes/12 (delete)
  # Upvote.find(12).destroy


end

