Rails.application.routes.draw do
  get 'home/index'
  # Add the routes for devise
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      confirmations: 'users/confirmations'
  }

  # Add an extra route for sign_out, redirect_to turns the delete to get
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  # Add the routes for the trials controller
  resources :trials, only: [:index, :show, :destroy] do
    get :list, path: ':study_id/list/', on: :collection
    get :set_failed, on: :member
    if Rails.env.test? or Rails.env.development?
      post :create, on: :collection
      get :new, on: :new
    end
  end
  # Add the routes for the studies controller
  resources :studies

  root to: 'home#index'
end
