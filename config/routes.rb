Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :users, only: [:index,:show]
  root to: 'users#index'
  



end
