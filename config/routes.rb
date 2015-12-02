Rails.application.routes.draw do
  resources :orders

  root 'products#index'
  resources :product_items
  resources :carts	
  resources :products

end
