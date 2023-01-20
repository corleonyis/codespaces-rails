Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'
  delete '/unsubscribe', to: 'users#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
