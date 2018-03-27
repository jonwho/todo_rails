Rails.application.routes.draw do
  root 'pages#home'

  get '/about' => 'pages#about'

  resources :todos, only: [:index, :create, :update, :destroy]
  resources :sessions, only: [:create, :destroy]

  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'
end
