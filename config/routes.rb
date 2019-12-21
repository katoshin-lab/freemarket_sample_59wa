Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :items, only: [:index, :new]

  resources :signups, only: [:new]
  get "signups/login" => "signups#login"
end
