Rails.application.routes.draw do
devise_for :users

resources :users, only: [:create]
 get "welcome/index"

 root 'welcome#index'
end
