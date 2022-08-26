Rails.application.routes.draw do


  get 'reviews/controller'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only:[:show] do
    resources :bookings, only:[:index]
  end

  resources :wearables  do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create, :edit, :update]
    #dont forget patch
  end

  resources :bookings, only:[:edit, :update, :show] do
    resources :payments, only: [:new]
  end

end
