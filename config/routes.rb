Rails.application.routes.draw do
  
  resource :session

  get 'signin' => 'sessions#new'
  get 'signup' => 'users#new'
  resources :users

  resources :orders

  root 'products#index'
  resources :product_items
  resources :carts	
  resources :products

end
