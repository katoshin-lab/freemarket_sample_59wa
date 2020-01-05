Rails.application.routes.draw do
  devise_for :users, module: :users
  root 'homes#index'
  resources :items, only: [:index, :new]
  resources :buy, only: [:show]
  resources :signups, only: [:new]
  resources :mypages, only: [:index]
end
