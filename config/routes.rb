Rails.application.routes.draw do

  resources :users
  resources :categories
  resources :products
  resources :stores
  resources :product_categories
  resources :pages
  get 'allproducts' , to:'products#allproducts'
  get 'admin_home' , to: 'pages#admin_home'
  root 'pages#guest'
  
  get 'sign_up' , to: 'users#new_customer'
  post 'sign_up' , to: 'users#customer_signup'

  get 'register' , to: 'users#new_owner'
  post 'register' , to: 'users#owner_signup'

  get 'sign_in' , to: 'sessions#new'
  post 'sign_in' , to: 'sessions#create'
  get 'sign_out' , to: 'sessions#destroy'
  
  get 'owner_home' , to: 'pages#owner_home'
end
