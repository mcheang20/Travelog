Rails.application.routes.draw do

  devise_for :views
devise_for :users

resources :wikis do
  resources :collaborators, only: [:create, :destroy]
end



resources :charges, only: [:new, :create, :destroy]

resources :users, only: [:create, :show]
 get "welcome/index"

 root 'welcome#index'
end
