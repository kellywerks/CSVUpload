Amazon::Application.routes.draw do
  resources :users
  resources :products
  resources :carts
end
