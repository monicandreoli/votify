Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :ideas do
    resources :votes, only: :create
  end

  resources :votes, only: [:update, :destroy]

  post '/chatrooms/:chatroom_id/messages', to: 'messages#create', as: :chatroom_messages

  get '/dashboard', to: 'ideas#dashboard'
  patch '/approve/:id', to: "ideas#approve", as: :approve
  patch '/decline/:id', to: "ideas#decline", as: :decline
end
