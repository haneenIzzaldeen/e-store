Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  get 'sign_up' , to: 'users#new'
  get 'sign_in' , to: 'sessions#new'
  post 'sign_in' , to: 'sessions#create'
  get 'sign_out' , to: 'sessions#destroy'
end
