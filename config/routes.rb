Rails.application.routes.draw do
  root 'homes#index'
  resources :buy, only: [:show]
  resources :items, only: [:index, :new, :show]
  resources :mypages, only: [:index] do 
    collection do
      get :logout
      get :profile
      get :addcard
      get :card_info
      get :personal_info
    end
  end
  resources :signups, only: [:new]

  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations",
    sessions:      "users/sessions"
  }
  devise_scope :user do
    get 'signups/sms_authentication' => 'signups#sms_authentication'
  end
  resources :signups do
    collection do
      get :sms_authentication
      post :sms_post
      get :sms_confirmation
      post :sms_check
      get :complete
    end
  end
  resources :deliveries, only: [:new, :create, :update]
  resources :payments, only: [:new, :create, :update, :destroy]
end
