Rails.application.routes.draw do

  root "projects#index"
  resources :projects, except: [:index]

end
