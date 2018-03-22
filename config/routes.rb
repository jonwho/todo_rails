Rails.application.routes.draw do
  resources :todos, only: [:index, :create, :update, :destroy]

  root 'pages#home'

  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
end
