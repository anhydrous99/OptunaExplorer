Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :trials, only: [:index, :show, :destroy] do
    get :list, path: ':study_id/list/', on: :collection
    get :set_failed, on: :member
  end
  resources :studies

  root to: 'studies#index'
end
