Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "gardens", to: "gardens#index"
  get "gardens/new", to: "gardens#new",  as: :new_gardens
  post "gardens", to: "gardens#create"

  get "gardens/:id", to: "gardens#show", as: :garden
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
