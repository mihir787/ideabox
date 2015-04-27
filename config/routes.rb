Rails.application.routes.draw do
  resource :user, only: [:new, :create, :show]
  resources :ideas do
    resources :pictures, only: [:new, :create, :destroy]
  end

  namespace :admin do
    resources :categories
    resources :images, only: [:new, :create, :destroy, :index]
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  end
