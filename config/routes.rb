Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  resources :users, only: [:update, :show, :index]

  get "welcome/index"

  root to: 'welcome#index'

  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks
  end

  resources :bookmarks

  resources :likes, only: [:index, :create, :destroy]
end
