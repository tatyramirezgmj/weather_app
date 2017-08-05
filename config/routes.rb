Rails.application.routes.draw do
  resource :users
  resource :sessions
  
  root 'sessions#new'


end
