Rails.application.routes.draw do
  resources :trials
  resources :studies
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
