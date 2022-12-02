Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  get 'admin_home' , to: 'pages#admin_home'
  get 'sign_up' , to: 'users#new'
  get 'sign_in' , to: 'sessions#new'
  post 'sign_in' , to: 'sessions#create'
  get 'sign_out' , to: 'sessions#destroy'
end
