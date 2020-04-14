Rails.application.routes.draw do
  root 'static#home'
  
  get '/signin', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/session/', to: 'session#destroy'


  resources :users, only: [:new, :create, :show]
  
  resources :properties do 
    resources :events
  end

end
