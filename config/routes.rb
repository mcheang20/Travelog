Rails.application.routes.draw do

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

resources :categories, only: [:index, :show]
resources :charges, only: [:new, :create, :destroy]

resources :users, only: [:create, :show]

 get "welcome/index"

 root 'welcome#index'
end
