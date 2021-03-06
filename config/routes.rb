Rails.application.routes.draw do

  root "projects#index"

  namespace :admin do
    root to: 'base#index'
    resources :users
  end

  get "/signin", to: 'sessions#new'
  post "/signin", to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :users

  resources :projects do
    resources :tickets
  end

end
