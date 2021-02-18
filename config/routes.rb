Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:index, :show]
  root "users#index"
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

  resources :relationships
  get 'user/:id', to: 'users#followed'
end
