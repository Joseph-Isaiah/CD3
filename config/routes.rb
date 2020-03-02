Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    if Rails.env.development?
    get 'kitchen_sink', to: 'pages#kitchen_sink'
  end
end

