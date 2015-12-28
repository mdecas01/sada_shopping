Rails.application.routes.draw do
  resources :categories

  root 'products#index'

  resource :session

  get 'signin' => 'sessions#new'
  get 'signup' => 'users#new'
  resources :users

  resources :orders
  resources :product_items
  resources :carts	
  resources :products do
    resources :reviews
  end  

end
