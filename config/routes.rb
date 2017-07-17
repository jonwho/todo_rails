Rails.application.routes.draw do
  resources :todos, only: [:index, :create, :edit, :destroy]

  root 'todos#index'
end
