Rails.application.routes.draw do
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end
  
  root to: "home#index"
  devise_for :users
  resources :home, only: [:index]
  resources :categories, only: [:index, :new, :create] do
    resources :entities, only: [:index, :new, :create]
  end
end
