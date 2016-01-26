Rails.application.routes.draw do

  resources :categories

  root 'products#index'

  resource :session

  get 'signin' => 'sessions#new'
  get 'signup' => 'users#new'
  resources :users do           
    resources :wishlists       ####################
  end
  resources :orders
  resources :product_items
  resources :carts	
  resources :products do
    resources :reviews
    resources :wishlists       
  end  

end
