Rails.application.routes.draw do
  get 'calls/new'
  get 'calls/create'
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :calls, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    get 'kitchen_sink', to: 'pages#kitchen_sink'
  end
end

