  Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/login'
  get '/users' => 'users#new'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/users/:id' => 'users#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#logout'
  # resource :users
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
