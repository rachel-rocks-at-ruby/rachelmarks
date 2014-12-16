Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users

  get "welcome/index"

  root to: 'welcome#index'

  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks
  end

end
