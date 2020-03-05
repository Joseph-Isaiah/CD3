Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "calls#new"
  end

  # # /condition_fields/55
  # resources :condition_fields, only: :show

  # /conditions/55/fields
  resources :conditions, only: [] do
    get "fields", on: :member
  end

  resources :calls, only: [:new, :create]

  # hospitals/5/dashboard
  resources :hospitals, only: [] do
    get :dashboard, on: :member
  end

  if Rails.env.development?
    get 'kitchen_sink', to: 'pages#kitchen_sink'
  end
end

