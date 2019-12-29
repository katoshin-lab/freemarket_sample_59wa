Rails.application.routes.draw do
  devise_for :users, module: :users
  root 'homes#index'
  resources :items, only: [:index, :new]
  resources :mypages do
    collection do
      get :logout
      get :profile
    end
  end
  resources :mypages, only: [:index, :new, :show]
  resources :signups, only: [:new]

end
