Rails.application.routes.draw do

devise_for :users

resources :wikis

resources :charges, only: [:new, :create, :destroy]

resources :users, only: [:create, :show]
 get "welcome/index"

 root 'welcome#index'
end
