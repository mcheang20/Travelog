Rails.application.routes.draw do

  post ':username/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':username/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

devise_for :users

resources :wikis do
 resources :comments, only: [:create, :destroy]
 resources :pics, only: [:show, :create, :destroy]
 resources :collaborators, only: [:create, :destroy]
 resources :votes, only: [:create, :destroy]
 resources :clips, only: [:show, :create, :destroy]
#  post '/like-up' => 'votes#like_up', as: :like_up
#  post '/like-down' => 'votes#like_down', as: :like_down
end

resources :categories, only: [:index, :new, :create,:show]
resources :charges, only: [:new, :create, :destroy]
resources :users, only: [:create, :show, :edit, :update]
resources :notifications do
  collection do
    post :mark_as_read
  end
end

resources :conversations do
  resources :messages, only: [:index, :create, :new]
 end

get "/most_popular" => 'wikis#most_popular', as: :most_popular
get "/most_recent" => 'wikis#most_recent', as: :most_recent
get "/your_likes" => 'wikis#your_likes', as: :likes
get "/followed_users" => 'wikis#followed_users', as: :followed_users
get "/all_wikisr" => 'wikis#all_wikis', as: :all_wikis

get "welcome/index"
get "welcome/about"
get "welcome/guidelines"
get "welcome/contact"

 authenticated :user do
  root :to => 'welcome#index', as: :authenticated_root
end

 root 'welcome#home'
end
