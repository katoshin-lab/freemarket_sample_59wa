Rails.application.routes.draw do
  root 'items#index'
  resources :buy, only: [:show]
  
  resources :items, only: [:index, :create, :new, :show, :edit, :update] do
    resource :likes, only: [:create, :destroy]
  end
  resources :mypages, only: [:index] do 
    collection do
      get :logout
      get :profile
      get :addcard
      get :card_info
      get :personal_info
    end
  end
  resources :users, only: [:new]
  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_up', to: 'users/registrations#new', as: :new_user_registration
    post 'users', to: 'users/registrations#create', as: :user_registration
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    post 'users/sign_in', to: 'users/sessions#create', as: :user_session
    delete 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
    get 'users/confirmation/new', to: 'users/confirmations#new', as: :new_user_confirmation
    post 'users/confirmation', to: 'users/confirmations#create'
    get 'users/confirmation', to: 'users/confirmations#show', as: :user_confirmation
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
