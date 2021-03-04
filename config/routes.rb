Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :ideas do
    resources :votes, only: :create
  end

  resources :votes, only: :destroy
  get '/dashboard', to: 'ideas#dashboard'
end
