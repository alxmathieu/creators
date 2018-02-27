Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update]
  resources :creators, only: [ :index, :new, :create, :show, :edit, :update ] do
    resources :upvotes, only: [:new, :create, :destroy ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
