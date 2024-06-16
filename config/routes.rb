Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sessions#new", as: :login
  resources :users
  resources :sessions, only: [:create]

  get '/login', to: 'sessions#new'
end
