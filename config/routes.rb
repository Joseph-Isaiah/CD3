Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "calls#new"
  end

  resources :calls, only: [:new, :create]
  if Rails.env.development?
    get 'kitchen_sink', to: 'pages#kitchen_sink'
  end
end

