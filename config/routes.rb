Rails.application.routes.draw do
  resources :items, only: [:index, :new]

  root to: 'items#index'
end
