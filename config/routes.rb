Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/:id', to: 'profiles#show', as: "profile"

  resources :gardens, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:new, :create] 
  end
  resources :bookings, only: [:show] do
    member do
      put :accept
      put :decline
    end
  end
end
