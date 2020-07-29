Rails.application.routes.draw do
  resources :trials, only: [:index, :show, :destroy] do
    get :list, path: ':study_id/list/', on: :collection
    get :set_failed, on: :member
  end
  resources :studies
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
