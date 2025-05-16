Rails.application.routes.draw do

  root "users#index"
  resources :users
  resources :users, only: [:index, :show, :edit, :update]

  resources :chats
  resources :chats, only: [:index, :show, :new, :create, :edit, :update]

  resources :messages



end
