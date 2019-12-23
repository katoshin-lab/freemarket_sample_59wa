Rails.application.routes.draw do
  root 'homes#index'
  resources :items, only: [:index, :new]
  resources :mypages, only: [:index]
  resources :signups, only: [:new]
end
