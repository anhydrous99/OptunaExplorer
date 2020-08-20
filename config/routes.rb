Rails.application.routes.draw do
  get 'home/index'
  # Routes for the Devise, User, Controllers
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      confirmations: 'users/confirmations'
  }
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  # Routes for the ip address controller
  resources :ip_addresses, only: [:index, :create, :destroy]

  # Routes for the trials controller
  resources :trials, only: [:index, :show, :destroy] do
    get :set_failed, on: :member
    if Rails.env.test? or Rails.env.development?
      post :create, on: :collection
      get :new, on: :new
    end
  end

  # Routes for the studies controller
  resources :studies

  root to: 'home#index'
end
