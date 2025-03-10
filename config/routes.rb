Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pokemons do
    resources :bookings
  end

  get "/my_pokemons", to: "pokemons#my_pokemons", as: :my_pokemons
  get "/my_bookings", to: "bookings#my_bookings", as: :my_bookings

  patch "accept/:id", to: "bookings#accept", as: :accept
  patch "refuse/:id", to: "bookings#decline", as: :decline

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
