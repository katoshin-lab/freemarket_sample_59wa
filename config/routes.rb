Rails.application.routes.draw do
  devise_for :users, module: :users
  root 'homes#index'
  get  "mypages/logout"  => "mypages#logout"
  resources :items, only: [:index, :new]
  resources :mypages, only: [:index]
end
