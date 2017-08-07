Rails.application.routes.draw do
  resource :users
  resources :favorite_cities
  root 'users#index'

  get 'users/new', as: 'signup'
  get '/login'  => 'sessions#new', as: "login"
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: 'logout'
end
