Rails.application.routes.draw do
  resources :carts do
    collection do
      post :add_to_cart
    end
  end
  resources :products
  resources :trips
  devise_for :users
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "trips#index"
end
