Rails.application.routes.draw do
  root 'static#home'
  
  #signup route
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  

  #logout route
  delete '/logout', to: 'sessions#destroy'

  #resource routes
  resources :users do
    resources :events
  end

  resources :users do
    resources :properties
  end

  resources :properties do 
    resources :events , only: [:new,:create,:index, :show]
  end

  resources :events do 
    resources :bookings, only: [:new,:create,:index, :show]
  end

  resources :users do
    resources :bookings, only: [:new,:create,:index, :show]
  end

  get '/auth/github/callback', to: 'sessions#github_login'

end
