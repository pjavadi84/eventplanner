Rails.application.routes.draw do
  root 'static#home'
  #signup route
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  #login route
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  #logout route
  delete '/logout', to: 'sessions#destroy'

  #resource routes
  resources :users do
    resources :events , only: [:new,:create,:index, :show]
  end

  resources :properties do 
    resources :events , only: [:new,:create,:index, :show]
  end

  resources :events do 
    resources :bookings, only: [:new,:create,:index, :show]
  end

end
