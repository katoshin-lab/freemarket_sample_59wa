Rails.application.routes.draw do
  root 'homes#index'
  resources :items, only: [:index, :new]

  resources :signups, only: [:new]
end
