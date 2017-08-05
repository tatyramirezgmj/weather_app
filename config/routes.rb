Rails.application.routes.draw do
  root 'sessions#new'
  resource :users

  get 'users/new'

  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  #
  get '/dashboard' => 'users#index', as: 'dashboard'
  #
end
