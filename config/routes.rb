Rails.application.routes.draw do
  resource :users
  resources :favorite_cities
  root 'users#new'


  get '/login' => 'sessions#new', as: 'login'
  get 'users/index'  => 'users#index', as: "dashboard"
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: 'logout'
end
