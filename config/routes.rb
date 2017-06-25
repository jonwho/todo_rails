Rails.application.routes.draw do
  resources :tasks
  resources :todos

  root to: 'todos#index'
end
