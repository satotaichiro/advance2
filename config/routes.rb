Rails.application.routes.draw do
  get 'home/about'
  
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :favorites, only: [:create, :destroy]
  resources :books

  root 'home#top'
end