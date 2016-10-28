Rails.application.routes.draw do

devise_for :views
devise_for :users

resources :wikis do
 resources :comments, only: [:create, :destroy]
 resources :pics, only: [:show, :create, :destroy]
 resources :collaborators, only: [:create, :destroy]
end



resources :charges, only: [:new, :create, :destroy]

resources :users, only: [:create, :show]
 get "welcome/index"

 root 'welcome#index'
end
