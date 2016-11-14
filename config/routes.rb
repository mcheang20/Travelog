Rails.application.routes.draw do

  post ':username/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':username/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

devise_for :views
devise_for :users

resources :wikis do
 resources :comments, only: [:create, :destroy]
 resources :pics, only: [:show, :create, :destroy]
 resources :collaborators, only: [:create, :destroy]
 resources :votes, only: [:create, :destroy]

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

 get "welcome/index"

 root 'welcome#index'
end
