Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :ideas do
    resources :votes, only: :create
  end

  resources :votes, only: [:update, :destroy]
  get '/dashboard', to: 'ideas#dashboard'
  patch '/approve/:id', to: "ideas#approve", as: :approve
  patch '/deny/:id', to: "ideas#deny", as: :deny
end
