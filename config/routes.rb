Rails.application.routes.draw do
  get 'mypages/index'
  root 'homes#index'
  resources :items, only: [:index, :new]

  resources :signups, only: [:new]
end
