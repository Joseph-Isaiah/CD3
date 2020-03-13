Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "pages#dashboard"
  end

  unauthenticated do |user|
    root to: "pages#home"
  end

  resources :conditions, only: [] do
    get "fields", on: :member
  end

  resources :calls, only: [:new, :create]
  namespace :call do
    get "emergencies", to: "emergencies#create"
  end

  resources :hospitals, only: [] do
    get :dashboard, on: :member, as: :dashboard
  end

  if Rails.env.development?
    get 'kitchen_sink', to: 'pages#kitchen_sink'
  end
end

