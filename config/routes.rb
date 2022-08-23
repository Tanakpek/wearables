Rails.application.routes.draw do
  get 'reviews/controller'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  resources :wearables  do
    resources :bookings, only: [:new, :create] #dont forget patch
  end

  delete '/bookings/:booking_id', to: 'bookings_controller#delete'
end
