Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  resources :users, only: [:update, :show, :index]

  get "welcome/index"

  root to: 'welcome#index'

  post :incoming, to: 'incoming#create'

  resources :bookmarks, only: [:index, :create, :destroy] do
    # 1. member, 2. collection
    # bookmakrs/1/my_rachelmarks <- my_rachelmarks belongs to Bookmakrs with id 1
    # bookmakrs/my_rachelmarks <- 
    # get 'my_rachelmarks', on: :member
  end

  resources :likes, only: [:index, :create, :destroy]

  resources :topics

  get "bookmarks/my_rachelmarks"
end
