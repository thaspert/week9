Rails.application.routes.draw do

  root 'movies#index'

  resources :movies
  resources :directors
  resources :actors
  resources :reviews

  resources :users

  get '/pages/weather' => 'pages#weather'
  get '/pages(/:page)' => 'pages#show', as: :pages

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
