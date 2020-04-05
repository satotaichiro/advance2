Rails.application.routes.draw do
  get 'home/about'
  
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resource :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

  root 'home#top'
end