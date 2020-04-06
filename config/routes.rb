Rails.application.routes.draw do
  get 'home/about'
  root 'home#top'
  
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
  	resources :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#follower', as: 'followings'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  resources :books do
  	resource :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
end