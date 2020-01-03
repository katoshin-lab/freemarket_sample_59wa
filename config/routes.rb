Rails.application.routes.draw do
  devise_for :users, module: :users
  root 'homes#index'
  resources :items, only: [:index, :new]
  resources :mypages, only: [:index] do
    collection do
      get :logout
      get :profile
    end
  end
  resources :signups, only: [:new]

end
