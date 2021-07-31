Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # routes for garden
  get "gardens", to: "gardens#index"
  get "gardens/new", to: "gardens#new",  as: :new_gardens
  post "gardens", to: "gardens#create"
  get "gardens/:id", to: "gardens#show", as: :garden
  # routes for booking
  get "bookings/new", to: "bookings#new",  as: :new_bookings
  post "bookings", to: "bookings#create"
  get "bookings/:id", to: "bookings#show", as: :booking
end
