Rails.application.routes.draw do
  resources :items, only: [:index, :new]
  root to: 'items#index'

  resources :signups, only: [:new]
end
