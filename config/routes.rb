Rails.application.routes.draw do
  root 'products#index'
  resources :product_items
  resources :carts	
  resources :products
end
