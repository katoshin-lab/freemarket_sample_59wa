Rails.application.routes.draw do
  root 'homes#index'
  resources :items, only: [:index, :new]
  get "/items/categories" => "items#categories"
  resources :signups, only: [:new]
end
