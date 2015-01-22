Rails.application.routes.draw do

  root "projects#index"

  resources :users

  resources :projects do
    resources :tickets
  end

end
