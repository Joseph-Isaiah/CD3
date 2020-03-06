Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "calls#new"
  end

  resources :conditions, only: [] do
    get "fields", on: :member
  end

  resources :calls, only: [:new, :create]

  resources :hospitals, only: [] do
    get :dashboard, on: :member, as: :dashboard
  end

  if Rails.env.development?
    get 'kitchen_sink', to: 'pages#kitchen_sink'
  end
end

