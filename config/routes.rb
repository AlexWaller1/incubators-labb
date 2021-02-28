Rails.application.routes.draw do
  # Reference routes.rb


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root(to: "static#home")
  #/hybrids/:hybrid_id/friends/:id
  resources :hybrids do
    resources :friends
    resources :minimarts, :controller => 'hybrid_minimarts'
   
    resources :motorhomes
    resources :places, :controller => 'hybrid_places'
  end
  resources :places do 
    collection do 
      #collection removes the :place_id
      post :location 
    end
  end
  resources :minimarts do
    collection do
      post :state
    end
    resources :sodas
  end

  resources :skateparks do
    resources :skateboarders
  end
  
  # will nest these routes later
  #resources :users, only: [:new,:create]

  
  get "/login", to: "sessions#new", as:"login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "logout"
  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"
  get '/auth/facebook', to: "facebook#create"
  #match '*a', :to => "static#home", via: [:get]
  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get, :post]
  get '*a', to: redirect('/')
  
end
