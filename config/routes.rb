Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  resources :users, only: [:update, :show, :index]

  get "welcome/index"

  root to: 'welcome#index'

  post :incoming, to: 'incoming#create'

  resources :bookmarks, only: [:index, :create, :destroy]

  resources :likes, only: [:index, :create, :destroy]

  resources :topics

  get "bookmarks/my_rachelmarks"
end
