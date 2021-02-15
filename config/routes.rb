Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root(to: "static#home")
  
  resources :hybrids do
    resources :friends
    resources :motorhomes
    resources :places, :controller => 'hybrid_places'
  end
  resources :places
  
  # will nest these routes later
  resources :users, only: [:new,:create]


  get "/login", to: "sessions#new", as:"login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "logout"
  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
  get '/auth/facebook', to: "facebook#create"
end
